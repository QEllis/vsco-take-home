import Foundation

struct FlickrAPI {
    
    private struct Constants {
        static let API_KEY = "6e9f68457a19912aa8a67408383165b4"
        static let BASE_URL = "https://api.flickr.com"
    }
    
    /// Creates a URL request for fetching image data from Flickr
    /// - Parameter searchTerm: Images which title, description, or tags contain the `searchTerm` will be returned
    /// - Parameter page: Specifies which page of 100 images will be returned. 1 by default
    /// - Returns: URRequest
    func fetchImageRequest(searchTerm: String, page: Int = 1) -> URLRequest {
        let url = URL(string: Constants.BASE_URL + "/services/rest/")!
        let queryItems = [
            URLQueryItem(name: "api_key", value: Constants.API_KEY),
            URLQueryItem(name: "method", value: "flickr.photos.search"),
            URLQueryItem(name: "text", value: searchTerm),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "page", value: String(describing: page)),
            URLQueryItem(name: "nojsoncallback", value: "1")
        ]
        var request = URLRequest(url: url, queryItems: queryItems)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "GET"
        return request
    }

    func fetchImageData(for imageUrl: URL, completion: @escaping (Data?) -> Void) -> URLSessionDataTask {
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: imageUrl), completionHandler: { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(data)
        })
        dataTask.resume()
        return dataTask
    }
    
}
