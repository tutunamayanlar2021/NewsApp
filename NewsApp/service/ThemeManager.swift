//
//  ThemeMannager.swift
//  NewsApp
//
//  Created by Kader Oral on 23.09.2023.
//
import UIKit

class ThemeManager {
     static let shared = ThemeManager()

        func loadSavedTheme() -> Bool {
            return UserDefaults.standard.bool(forKey: Keys.prepfersTheme)
        }

    func applyTheme( _ isDarkMode :Bool , view: UIView) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.forEach { window in
                window.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
            }
          
        }
      //  UserDefaults.standard.set(isDarkMode, forKey: themeKey)
    }
    
}
struct Keys {
    static let prefersSegment  = "prefersSegment"
    static let prepfersTheme = "prepfersTheme"
}
