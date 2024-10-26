//
//  Settings.swift
//  HappyMovie
//
//  Created by Hai Pham on 17/10/2024.
//

import Foundation

enum SettingKeys: String {
    case language
    case theme
}

struct Settings {
    static var language = UserDefault<String>(key: SettingKeys.language.rawValue, defaultValue: String.languageCodeDevice)
    
    static var theme = UserDefault<Int>(key: SettingKeys.theme.rawValue, defaultValue: Theme.freshOrange.rawValue)
}

struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    private let userDefault: UserDefaults?
    
    init(key: String, defaultValue: T, userDefault: UserDefaults? = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefault = userDefault
    }
    
    var value: T {
        get {
            if let value = userDefault?.object(forKey: key) as? T {
                return value
            } else {
                userDefault?.setValue(defaultValue, forKey: key)
                userDefault?.synchronize()
                return defaultValue
            }
        }
        
        set {
            userDefault?.setValue(newValue, forKey: key)
        }
    }
}
