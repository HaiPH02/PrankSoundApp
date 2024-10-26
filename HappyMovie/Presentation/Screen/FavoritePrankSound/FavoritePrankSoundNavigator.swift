//
//  FavoritePrankSoundNavigator.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import Foundation
import UIKit

protocol FavoritePrankSoundNavigatorProtocol: BaseNavigator {
    
}

class FavoritePrankSoundNavigator: FavoritePrankSoundNavigatorProtocol {
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    var navigationController: UINavigationController
    
    
}
