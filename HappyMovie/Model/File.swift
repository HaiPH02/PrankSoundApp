//
//  File.swift
//  HappyMovie
//
//  Created by Hai Pham on 17/10/2024.
//

import Foundation

enum LoadingStatus: Equatable {
    case initial
    case inProcess
    case success
    case error(String)
}
