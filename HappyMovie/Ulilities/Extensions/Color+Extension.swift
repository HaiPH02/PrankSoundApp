//
//  Color+Extension.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
            let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int: UInt64 = 0
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
            }

            self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue:  Double(b) / 255,
                opacity: Double(a) / 255
            )
        }
}


// MARK: - ThemeColor

struct ThemeColor {
    let bastelle: String
    let englishDaisy: String
    let philipineGray: String
    let jellyBean: String
    let americanBlue: String
    let floralWhite: String
    let blackOlive: String
    let cultured: String
    let darkLiver: String
}

extension ThemeColor {
    static let freshOrange = ThemeColor(bastelle: "2B2B30",
                                        englishDaisy: "FFCB48",
                                        philipineGray: "8C8C92",
                                        jellyBean: "db5656",
                                        americanBlue: "354279",
                                        floralWhite: "fffaf5",
                                        blackOlive: "404040",
                                        cultured: "F6F6F6",
                                        darkLiver: "4F4F4F")
}

extension ThemeColor {
    static let themeConfiguration: [Theme: ThemeColor] = [.freshOrange : .freshOrange]
}

// MARK: - Theme
enum Theme: Int, CaseIterable {
    case freshOrange
    
    private var themeColor: ThemeColor {
        ThemeColor.themeConfiguration[self] ?? .freshOrange
    }
    
    static var current: ThemeColor {
        return Theme(rawValue: Settings.theme.value)?.themeColor ?? Theme.freshOrange.themeColor
    }
}

extension Color {
    static var bastelle: Color { Theme.current.bastelle.color }
    static var englishDaisy: Color { Theme.current.englishDaisy.color }
    static var philipineGray: Color { Theme.current.philipineGray.color }
    static var jellyBean: Color { Theme.current.jellyBean.color }
    static var americanBlue: Color { Theme.current.americanBlue.color }
    static var floralWhite: Color { Theme.current.floralWhite.color }
    static var blackOlive: Color { Theme.current.blackOlive.color }
    static var cultured: Color { Theme.current.cultured.color }
    static var darkLiver: Color { Theme.current.darkLiver.color }
}
