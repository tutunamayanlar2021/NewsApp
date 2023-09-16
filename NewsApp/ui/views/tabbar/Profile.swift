//
//  Profile.swift
//  NewsApp
//
//  Created by Kader Oral on 13.09.2023.
//

import UIKit
import Firebase
class Profile: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 40
        
    }
    
    @IBAction func logOutPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func deleteAccountPressed(_ sender: UIButton) {
        let user = Auth.auth().currentUser
        
        user?.delete { error in
            if let e = error {
                self.showError(error: e)
            } else {
                self.configureGif(gifName: K.deleteAccountImageName)
            }
        }
    }
    
    
    
}
