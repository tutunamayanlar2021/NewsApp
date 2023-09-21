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
    
    
    @IBOutlet weak var segTheme: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        
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
    
    @IBAction func segThemePressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .dark
            ThemeManager.shared.setTheme(.dark)
            
            
        case 1:
            UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .light
            ThemeManager.shared.setTheme(.light)
            
            
        default:
            break
        }
        applyTheme()
        
    }
    
     func applyTheme() {
        let currentTheme = ThemeManager.shared.getCurrentTheme()
        switch currentTheme {
        case .light:
            view.backgroundColor = UIColor.white
        case .dark:
            view.backgroundColor = UIColor.black
        }
    }
}
