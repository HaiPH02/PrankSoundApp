//
//  Collection+Extension.swift
//  HappyMovie
//
//  Created by Hai Pham on 21/10/2024.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
