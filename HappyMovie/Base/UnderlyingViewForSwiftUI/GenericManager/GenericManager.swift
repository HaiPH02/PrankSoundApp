//
//  GenericManager.swift
//  HappyMovie
//
//  Created by Hai Pham on 21/10/2024.
//

import Foundation
import UIKit

protocol GenericSection: Identifiable, Equatable {
    var title: String { get }
    var data: [any Cell] { get set }
}

extension GenericSection {
    var id: String {
        return UUID().uuidString
    }
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

protocol Cell: Identifiable, Equatable { }

extension Cell {
    var id: String {
        return UUID().uuidString
    }
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
