import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private let apiKey = "f70ed7d37dcf4c21a647fe5ac3be99df" // Replace with your actual API key
    
    private init() {}
    
    func getNews(category: String, completion: @escaping (Result<NewsResponse, Error>) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=US&category=\(category)&apiKey=\(apiKey)") else {
            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }
        
        AF.request(url, method: .get).response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    do {
                        let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                        completion(.success(newsResponse))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "No data received", code: 0, userInfo: nil)
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
