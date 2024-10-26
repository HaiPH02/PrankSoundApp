//
//  UIColor+Extension.swift
//  HappyMovie
//
//  Created by Hai Pham on 20/10/2024.
//

import Foundation
import UIKit

extension UIColor {
    static var bastelle: UIColor { Theme.current.bastelle.uiColor }
    static var englishDaisy: UIColor { Theme.current.englishDaisy.uiColor }
    static var philipineGray: UIColor { Theme.current.philipineGray.uiColor }
    static var jellyBean: UIColor { Theme.current.jellyBean.uiColor }
    static var americanBlue: UIColor { Theme.current.americanBlue.uiColor }
    static var floralWhite: UIColor { Theme.current.floralWhite.uiColor }
    static var cultured: UIColor { Theme.current.cultured.uiColor }
}

extension UIColor {
    
    /// A convenient method to return a color from a hex string
    /// - Parameters:
    ///   - hex: The hex color code
    ///   - alpha: optional transparency to apply to the color
    convenience init(_ hex: String, alpha: CGFloat = 1.0) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") { cString.removeFirst() }

        if cString.count != 6 {
            self.init("000000") // return black color for wrong hex input
            return
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format: "%06x", rgb).uppercased()
    }
}
