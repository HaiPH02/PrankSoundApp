//
//  Menu.swift
//  HappyMovie
//
//  Created by Hai Pham on 23/10/2024.
//

import Foundation

struct Menu: Identifiable {
    let id: String = UUID().uuidString
    
    let image: String
    
    let name: String
    
    let backgroundTitle: String
}
