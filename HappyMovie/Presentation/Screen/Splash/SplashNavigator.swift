//
//  SplashNavigator.swift
//  HappyMovie
//
//  Created by Hai Pham on 18/10/2024.
//

import Foundation
import UIKit

protocol SplashNavigatorProtocol: BaseNavigator {
    func goToChooseSound()
}

class SplashNavigator: SplashNavigatorProtocol {
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    var navigationController: UINavigationController
    
    func goToChooseSound() {
        // code
    }
}


