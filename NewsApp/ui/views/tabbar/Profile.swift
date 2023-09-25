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
    @IBOutlet weak var onOffSwitch: UISwitch!
    @IBOutlet weak var segTheme: UISegmentedControl!

    let defaults = UserDefaults.standard
    var isDarkMode = false
    var prefersDarkMode = false

    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 40
        checkForStylePreference()
    }

    @IBAction func logOutPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError)")
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

    @IBAction func sgmThemePressed(_ sender: UISegmentedControl) {
        isDarkMode = sender.selectedSegmentIndex == 1
        saveDefaultsPreference()
        ThemeManager.shared.applyTheme(isDarkMode, view: self.view)
        print("isDarkMode: \(isDarkMode)")
    }

    func saveDefaultsPreference() {
        defaults.set(prefersDarkMode, forKey: Keys.prefersSegment)
        defaults.set(isDarkMode, forKey: Keys.prepfersTheme)
    }

    func checkForStylePreference() {
        prefersDarkMode = defaults.bool(forKey: Keys.prefersSegment)
        segTheme.selectedSegmentIndex = prefersDarkMode ? 0 : 1
        print("prefersDarkMode: \(prefersDarkMode)")
    }
}
