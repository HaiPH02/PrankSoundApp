//
//  AppNavigator.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import UIKit

protocol AppNavigatorProtocol: BaseNavigator {
    var window: UIWindow? { get }
    func setRootViewController()
    func setChooseSoundViewController()
}

class AppNavigator: AppNavigatorProtocol {
    init(window: UIWindow?) {
        self.window = window
        setRootViewController()
    }
    var window: UIWindow?
    
    var navigationController: UINavigationController = UINavigationController()
    
    func setRootViewController() {
        let view = SplashView()
        let viewController = BaseViewController(rootView: view)
        
        navigationController.setViewControllers([viewController], animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func setChooseSoundViewController() {
        
        let viewController = MainTabBarViewController()
        
        navigationController.setViewControllers([viewController], animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
