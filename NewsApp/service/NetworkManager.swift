import Foundation
import Alamofire
class NetworkManager {
    static let shared = NetworkManager()

    private let apiKey = "f70ed7d37dcf4c21a647fe5ac3be99df"
    
    private var articles: [News] = [] // Burada articles özelliği eklendi
    
    private init() {}

    func getNews(category: Category, completion: @escaping (Result<NewsResponse, Error>) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=US&category=\(category)&apiKey=\(apiKey)")
        else {
            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }
        print(url)

        AF.request(url, method: .get).response { [weak self] response in
            guard let self = self else { return }

            switch response.result {
            case .success(let data):
                if let data = data {
                    do {
                        let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                        self.articles = newsResponse.articles // Makaleleri güncelle
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

    func getArticles() -> [News] {
        return articles
    }
}
