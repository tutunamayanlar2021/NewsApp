//
//  Web.swift
//  NewsApp
//
//  Created by Kader Oral on 21.09.2023.
//

import UIKit
import WebKit

class Web: UIViewController{
    
    @IBOutlet weak var webView: WKWebView!
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: url ?? "https://developer.apple.com")!))
       

    }
}
