//
//  MenuItemDetailNavigator.swift
//  HappyMovie
//
//  Created by Hai Pham on 25/10/2024.
//

import Foundation
import SwiftUI

protocol MenuItemDetailNavigatorProtocol: BaseNavigator {
    
}

class MenuItemDetailNavigator: MenuItemDetailNavigatorProtocol {
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    var navigationController: UINavigationController
}


