//
//  HomeNavigator.swift
//  HappyMovie
//
//  Created by Hai Pham on 23/10/2024.
//

import Foundation
import UIKit

protocol HomeNavigatorProtocol: BaseNavigator {
    func goToItemDetail()
}

class HomeNavigator: HomeNavigatorProtocol {
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    var navigationController: UINavigationController
    
    func goToItemDetail() {
        // update soon
    }
    
}
