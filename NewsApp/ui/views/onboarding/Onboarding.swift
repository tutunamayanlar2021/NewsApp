//
//  Welcome.swift
//  NewsApp
//
//  Created by Kader Oral on 12.09.2023.
//

import UIKit

class Onboarding: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    

}


class Core{
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    func setIsNotNewUser()  {
        
    }
}
