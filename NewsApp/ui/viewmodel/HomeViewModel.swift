import UIKit

class HomeViewModel {
    private let networkManager = NetworkManager.shared
    var articles: [News] = []
    var selectedCategorytType: Category?

    
    var numberOfArticles: Int {
        return articles.count
    }
    
    func getNews(completion: @escaping () -> Void) {
        networkManager.getNews(category: selectedCategorytType ?? .general) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.articles = response.articles
                completion()
            case .failure(let error):
                print("Error: \(error)")
                completion()
            }
        }
    }
    
    
    
    
    func imageURLForArticle(at index: Int) -> URL? {
        guard index < articles.count else {
            return nil
        }
        return URL(string: articles[index].urlToImage ?? K.noImageforNews)
    }
    func filterArticlesBySearchText(_ searchText: String?) -> [News]{
        if let searchText = searchText, !searchText.isEmpty {
                // Arama metni varsa ve boş değilse, filtrele
                return articles.filter { article in
                    article.title.lowercased().contains(searchText.lowercased())
                }
            } else {
                // Arama metni yoksa veya boşsa, tüm orijinal makaleleri döndür
                return networkManager.getArticles() // Bu satırı güncelledik
            }
        }

        
        
    
}
