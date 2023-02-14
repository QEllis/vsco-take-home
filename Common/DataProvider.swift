import Foundation

class DataProvider {
    
    private struct Constants {
        static let DEFAULT_SEARCH_TERM = "sunset"
    }
    
    private let imageAPI = FlickrAPI()
    
    /// Will fetch data from provided image API
    /// - Parameter searchTerm: data that contains the `searchParameter` will be returned
    func fetchData(for searchTerm: String = Constants.DEFAULT_SEARCH_TERM, completion: @escaping (Data?) -> Void) {
        let request = imageAPI.fetchImageRequest(searchTerm: searchTerm)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let data = data, let string = String(data: data, encoding: .utf8) {
                let dict = try? JSONSerialization.jsonObject(with: data, options: [.allowFragments])
//                print("QE - dict: \(dict)")
//                print(string)
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }

            completion(data)
        }

        task.resume()
    }

    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
