//
//  NSObject+Extension.swift
//  HappyMovie
//
//  Created by Hai Pham on 21/10/2024.
//

import Foundation

extension NSObject {
    @nonobjc class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    var className: String {
        return type(of: self).className
    }
}
