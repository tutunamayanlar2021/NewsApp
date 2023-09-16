//
//  Welcome.swift
//  NewsApp
//
//  Created by Kader Oral on 12.09.2023.
//

import UIKit

class Welcome: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        titleLabel.text = ""
        var charIndex = 0.0
        let titleText =  K.appName
        
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false){_ in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }

    }
    

  

}
