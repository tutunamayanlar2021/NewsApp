//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Kader Oral on 20.09.2023.
//

import Foundation
import UIKit


class HomeViewModel {
    private let networkManager = NetworkManager.shared
    private var newsResponse: NewsResponse?
    
    var numberOfArticles: Int {
        return newsResponse?.articles.count ?? 0
    }
    
    func getNews(category: String, completion: @escaping () -> Void) {
        networkManager.getNews(category: category) { result in
            switch result {
            case .success(let response):
                self.newsResponse = response
                completion()
            case .failure(let error):
                print("Error: \(error)")
                completion()
            }
        }
    }
    
    func article(at index: Int) -> News? {
        guard let articles = newsResponse?.articles, index < articles.count else {
            return nil
        }
        return articles[index]
    }
  
    
    func imageURLForArticle(at index: Int) -> URL? {
           guard let articles = newsResponse?.articles, index < articles.count else {
               return nil
           }
           let article = articles[index]
        return URL(string: article.urlToImage ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png" )
       }
           
}
