//
//  BaseNavigator.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import UIKit

protocol BaseNavigator {
    var navigationController: UINavigationController { get }
    func pop()
    func dismiss()
}

extension BaseNavigator {
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true)
    }
}
