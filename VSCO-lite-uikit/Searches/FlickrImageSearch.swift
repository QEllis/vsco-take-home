//
//  FlickrImageSearch.swift
//  VSCO-lite
//
//  Created by Quinn Ellis on 2/13/23.
//

import Foundation
import Combine

struct FlickrPhoto: Equatable {

    let id: String
    let secret: String
    let server: String
    let title: String

    init?(data: [String: Any]) {
        guard let id = data["id"] as? String,
              let secret = data["secret"] as? String,
              let server = data["server"] as? String,
              let title = data["title"] as? String else { return nil }
        self.id = id
        self.secret = secret
        self.server = server
        self.title = title
    }

}

final class FlickrImageSearch {

    private var queryString: String
    private var nextPage: Int

    // Store the maximum number of pages we can fetch
    // for the queryString
    private var totalPages: Int?

    @Published var results: [FlickrPhoto] = []

    init(queryString: String, nextPage: Int = 1) {
        self.queryString = queryString
        self.nextPage = nextPage
        loadMore()
    }

    public func loadMore() {
        DataProvider().fetchData(for: queryString) { [weak self] data in
            guard let self = self, let data = data else { return }
            guard let dict = try? JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any] else { return }
            guard let photos = dict["photos"] as? [String: Any],
                  let photoData = photos["photo"] as? [[String: Any]] else { return }

            self.totalPages = dict["pages"] as? Int
            let flickrPhotos: [FlickrPhoto] = photoData.compactMap({ FlickrPhoto(data: $0) })
            self.nextPage += 1
            self.results.append(contentsOf: flickrPhotos)
        }
    }

    public func hasMorePages() -> Bool {
        guard let totalPages = totalPages else { return true }
        return nextPage <= totalPages
    }
}
