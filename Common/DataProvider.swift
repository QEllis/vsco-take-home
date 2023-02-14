import Foundation

class DataProvider {
    
    private struct Constants {
        static let DEFAULT_SEARCH_TERM = "sunset"
    }
    
    private let imageAPI = FlickrAPI()
    
    /// Will fetch data from provided image API
    /// - Parameter searchTerm: data that contains the `searchParameter` will be returned
    func fetchData(for searchTerm: String = Constants.DEFAULT_SEARCH_TERM) {
        let request = imageAPI.fetchImageRequest(searchTerm: searchTerm)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let string = String(data: data, encoding: .utf8) {
                print(string)
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()
    }
}
