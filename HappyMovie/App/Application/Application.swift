//
//  Application.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import Foundation
import SwiftUI

class Application {
    static let share = Application()
    
    private init() {
        
    }
    
    var navigator: AppNavigator? {
        UIViewController.currentSceneDelegate?.navigator
    }
}
