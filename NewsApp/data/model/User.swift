//
//  User.swift
//  NewsApp
//
//  Created by Kader Oral on 16.09.2023.
//

import Foundation

class User{
    var user_email: String?
    var user_password: String?
    var user_bookmarkedNews: News?
    
    init() {
    }
    
    init(user_id: Int,user_email: String,user_password: String,user_bookmarkedNews: News) {
        self.user_password = user_password
        self.user_bookmarkedNews = user_bookmarkedNews
    }
}

