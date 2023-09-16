//
//  Register.swift
//  NewsApp
//
//  Created by Kader Oral on 12.09.2023.
//

import UIKit
import Firebase

class Register: UIViewController {
    
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text,let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    self.showError(error: e)
                }else{
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    }
                    
                }
            }
            
            
        }
        
    }

