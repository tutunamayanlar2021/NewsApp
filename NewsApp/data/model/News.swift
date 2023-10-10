//
//  News.swift
//  NewsApp
//
//  Created by Kader Oral on 20.09.2023.
//

import Foundation
class News: Codable {
    var source: Source?
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: String
    var content: String?
}
class NewsResponse: Codable {
    var status: String
    var totalResults: Int
    var articles: [News]
}

struct Source: Codable {
    var name: String?
}



enum Category: CaseIterable{
    case business
    case health
    case entertainment
    case general
    case science
    case sports
    case technology
    
    var categoryType: String{
        switch self {
        case .business:
            return "Business"
        case .health:
            return "Health"
        case .entertainment:
            return "Entertainment"
        case .general:
            return "General"
        case .science:
            return "Science"
        case .sports:
            return "Sports"
        case .technology:
            return "Technology"
                
        }
    }
    
}
