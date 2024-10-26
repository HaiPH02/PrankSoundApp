//
//  PrankSoundCode.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import Foundation
import SwiftUI

class PrankSoundCode: Identifiable {
    var code: String
    
    var title: String
    
    var image: String
    
    var isSelected: Bool
    
    init(code: String, title: String, image: String, isSelected: Bool) {
        self.code = code
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
}
