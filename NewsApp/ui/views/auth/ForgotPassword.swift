//
//  ForgotPassword.swift
//  NewsApp
//
//  Created by Kader Oral on 15.09.2023.
//

import UIKit
import Firebase

class ForgotPassword: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func sendEmailPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text{
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let e = error{
                    self.showError(error: e)
                }else{
                    self.configureGif(gifName: K.sendEmailImageName)
                }
            }
        }
        
      
    }
}
