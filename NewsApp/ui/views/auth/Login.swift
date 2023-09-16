//
//  Login.swift
//  NewsApp
//
//  Created by Kader Oral on 12.09.2023.
//

import UIKit
import Firebase

class Login: UIViewController {

    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

   
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text,let password = passwordTextfield.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    self.showError(error: e)
                }else{
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)

                }
            }
        }
       
    }

    
}
