//
//  SceneDelegate.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navigator: AppNavigator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        setupNavigator(sceneWindow: scene)
    }
}

extension SceneDelegate {
    private func setupNavigator(sceneWindow: UIScene) {
        if let sceneWindow = sceneWindow as? UIWindowScene {
            window = UIWindow(windowScene: sceneWindow)
            window?.makeKeyAndVisible()
            
            navigator = AppNavigator(window: window)
        }
    }
}
