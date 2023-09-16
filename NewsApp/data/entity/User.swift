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
    var user_bookmarkedNews: News?
    
    
    init() {
    }
    
    init(user_id: Int, user_name: String,user_bookmarkedNews: News) {
        self.user_id = user_id
        self.user_name = user_name
        self.user_bookmarkedNews = user_bookmarkedNews
    }
    
    
}


struct News{
     let title: String
     let description: String
     let url: String
}
