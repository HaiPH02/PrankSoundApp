//
//  MainTabBarViewController.swift
//  HappyMovie
//
//  Created by Hai Pham on 18/10/2024.
//

import Foundation
import UIKit

enum Tab: Int {
    case hotTrend
    case fakeCall
    case home
    case favorite
    case voiodChanger
}

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        tabBar.tintColor = .jellyBean
        tabBar.unselectedItemTintColor = .americanBlue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setupTabBar() {
        viewControllers = [
            buildHotTrend(),
            buildFakeCall(),
            buildHome(),
            buildFavorite(),
            buildSettings()
        ]
    }
}

extension MainTabBarViewController {
    private func buildHome() -> UINavigationController {
        // update soon
        let navigationController = UINavigationController()
        
        let navigator = HomeNavigator(navigationController: navigationController)
        let viewModel = HomeViewModel(navigator: navigator)
        
        let view = HomeView(viewModel: viewModel)
        let viewController = BaseViewController(rootView: view)
        navigationController.setViewControllers([viewController], animated: false)
        
        navigationController.tabBarItem = UITabBarItem(title: .home,
                                                       image: .home,
                                                       tag: Tab.home.rawValue)
        return navigationController
    }
    
    private func buildHotTrend() -> UINavigationController {
        // update soon
        let navigationController = UINavigationController()
        let view = HorTrendView()
        let viewController = BaseViewController(rootView: view)
        navigationController.setViewControllers([viewController], animated: false)
        
        navigationController.tabBarItem = UITabBarItem(title: .hotTrend,
                                                       image: .hotTrend,
                                                       tag: Tab.hotTrend.rawValue)
        return navigationController
    }
    
    private func buildFakeCall() -> UINavigationController {
        // update soon
        let navigationController = UINavigationController()
        let view = FakeCallView()
        let viewController = BaseViewController(rootView: view)
        navigationController.setViewControllers([viewController], animated: false)
        
        navigationController.tabBarItem = UITabBarItem(title: .fakeCall,
                                                       image: .fakeCall,
                                                       tag: Tab.fakeCall.rawValue)
        return navigationController
    }
    
    private func buildFavorite() -> UINavigationController {
        // update soon
        let navigationController = UINavigationController()
        let view = FavoriteView()
        let viewController = BaseViewController(rootView: view)
        navigationController.setViewControllers([viewController], animated: false)
        
        navigationController.tabBarItem = UITabBarItem(title: .favorite,
                                                       image: .favorite,
                                                       tag: Tab.favorite.rawValue)
        return navigationController
    }
    
    private func buildSettings() -> UINavigationController {
        // update soon
        let navigationController = UINavigationController()
        let view = SettingView()
        let viewController = BaseViewController(rootView: view)
        navigationController.setViewControllers([viewController], animated: false)
        
        navigationController.tabBarItem = UITabBarItem(title: .voiodChanger,
                                                       image: .voiodChanged,
                                                       tag: Tab.voiodChanger.rawValue)
        return navigationController
    }
}
