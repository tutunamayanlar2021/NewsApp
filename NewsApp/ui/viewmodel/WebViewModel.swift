//
//  WebViewModel.swift
//  NewsApp
//
//  Created by Kader Oral on 28.09.2023.
//

import Foundation

class WebViewModel{
    
    var url: String
    init(url: String) {
        self.url = url
    }
    
    func getUrl() -> URL{
        return URL(string: url )!
    }
}
