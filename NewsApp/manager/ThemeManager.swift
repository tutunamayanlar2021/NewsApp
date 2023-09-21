//
//  ThemeManager.swift
//  NewsApp
//
//  Created by Kader Oral on 21.09.2023.
//

import Foundation
enum Theme: String {
    case light = "Light"
    case dark = "Dark"
}

class ThemeManager {
    static let shared = ThemeManager()
    private var currentTheme: Theme {
        didSet {
            UserDefaults.standard.set(getCurrentTheme().rawValue, forKey: "selectedTheme")
            
            // Tema değişikliği bildirimini post et
            NotificationCenter.default.post(name: Notification.Name("ThemeChangedNotification"), object: nil)
        }
    }
    
    init() {
        if let savedTheme = UserDefaults.standard.string(forKey: "selectedTheme"), let theme = Theme(rawValue: savedTheme) {
            currentTheme = theme
        } else {
            currentTheme = .dark
        }
    }
    
    func getCurrentTheme() -> Theme {
        return currentTheme
    }
    
    func setTheme(_ theme: Theme) {
        currentTheme = theme
    }
    
    func themeChanged() {
        // Tema değişikliği bildirimi için post et
        NotificationCenter.default.post(name: Notification.Name("ThemeChangedNotification"), object: nil)
    }
}
