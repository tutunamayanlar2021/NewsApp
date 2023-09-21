//
//  User.swift
//  NewsApp
//
//  Created by Kader Oral on 16.09.2023.
//

import Foundation

class User{
    var user_id: Int?
    var user_name: String?
    var user_email: String?
    var user_password: String?
    var user_bookmarkedNews: News?
    
    init() {
    }
    
    init(user_id: Int, user_name: String,user_email: String,user_password: String,user_bookmarkedNews: News) {
        self.user_id = user_id
        self.user_name = user_name
        self.user_email = user_email
        self.user_password = user_password
        self.user_bookmarkedNews = user_bookmarkedNews
    }
}

class NewsResponse: Codable {
    var status: String
    var totalResults: Int
    var articles: [News]
}

struct Source: Codable {
    var name: String?
}

