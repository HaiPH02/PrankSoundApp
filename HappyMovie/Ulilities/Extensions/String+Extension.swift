//
//  String+Extension.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import SwiftUI

enum LanguageCode: String, CaseIterable {
    case vietnam = "vi"
    case english = "en"
}

extension String {
    var image: Image {
        return Image(self)
    }
    
    var uiImage: UIImage? {
        return UIImage(named: self)
    }
    
    var uiColor: UIColor {
        return UIColor(self)
    }
    
    var color: Color {
        return Color(hex: self)
    }
}

extension String {
    init(resourceName: String, localizedKey key: String) {
        var bundle: Bundle? = Bundle.main
        let resourceName = resourceName
        if let path = Bundle.main.path(forResource: resourceName, ofType: "lproj") {
            bundle = Bundle(path: path)
        }
        self = bundle?.localizedString(forKey: key, value: nil, table: nil) ?? key
    }
 }

extension String {
    init(localizedKey key: String) {
        self.init(resourceName: .localeIdentifier, localizedKey: key)
    }
}

extension String {
    
    static private let preferredLanguages = NSLocale.preferredLanguages
    
    static var languageCodeDevice: String {
        guard
            let currentLanguage = preferredLanguages.first,
            let languageCode = LanguageCode.allCases.filter({
                currentLanguage.lowercased().contains( $0.rawValue.lowercased())
            }).first
        else {
            return LanguageCode.english.rawValue
        }
        
        return languageCode.rawValue
    }
    
    static var localeIdentifier: String {
        Settings.language.value
    }
    
}

extension String {
    static var helloWorld: String { String(localizedKey: "helloWorld") }
    static var locked: String { String(localizedKey: "locked") }
    static var scanFaceID: String { String(localizedKey: "scanFaceID") }
    static var english: String { String(localizedKey: "english") }
    static var vietnamese: String { String(localizedKey: "vietnamese") }
    static var error: String { String(localizedKey: "error") }
    static var cancel: String { String(localizedKey: "cancel") }
    static var home: String { String(localizedKey: "home") }
    static var nowPlaying: String { String(localizedKey: "nowPlaying") }
    static var viewAll: String { String(localizedKey: "viewAll") }
    static var trending: String { String(localizedKey: "trending") }
    static var topRated: String { String(localizedKey: "topRated") }
    static var movie: String { String(localizedKey: "movie") }
    static var tv: String { String(localizedKey: "tv") }
    static var search: String { String(localizedKey: "search") }
    static var discover: String { String(localizedKey: "discover") }
    static var setting: String { String(localizedKey: "setting") }
    static var upcoming: String { String(localizedKey: "upcoming") }
    static var vote: String { String(localizedKey: "vote") }
    static var min: String { String(localizedKey: "min") }
    static var cast: String { String(localizedKey: "cast") }
    static var crews: String { String(localizedKey: "crews") }
    static var findOutMore: String { String(localizedKey: "findOutMore") }
    static var smimilar: String { String(localizedKey: "smimilar") }
    static var orderNow: String { String(localizedKey: "orderNow") }
    static var searchMovie: String { String(localizedKey: "searchMovie") }
    static var imagePlaceholderText: String { String(localizedKey: "imagePlaceholderText") }
    
    static var hotTrend: String { String(localizedKey: "hotTrend") }
    static var fakeCall: String { String(localizedKey: "fakeCall") }
    static var favorite: String { String(localizedKey: "favorite") }
    static var voiodChanger: String { String(localizedKey: "VoiodChanger") }

    
}
