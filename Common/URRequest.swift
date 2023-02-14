import Foundation

extension URLRequest {
    init(url: URL, queryItems: [URLQueryItem]) {
        if #available(iOS 16, *) {
            self.init(url: url)
            self.url?.append(queryItems: queryItems)
        } else {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            if let componentsURL = components?.url {
                self.init(url: componentsURL)
            } else {
                self.init(url: url)
            }
        }
    }
}
