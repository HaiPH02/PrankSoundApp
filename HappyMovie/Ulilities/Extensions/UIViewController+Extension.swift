//
//  UIViewController+Extension.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import Foundation
import SwiftUI

extension UIViewController {
    
    static var appDelegate: UIApplicationDelegate? {
        return UIApplication.shared.delegate
    }
    
    static var sceneDelegate: UISceneDelegate? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate else { return nil }
        
        return delegate
    }
    
    static var currrentAppDelegate: AppDelegate? {
        return appDelegate as? AppDelegate
    }
    
    static var currentSceneDelegate: SceneDelegate? {
        return sceneDelegate as? SceneDelegate
    }
    
    static func rootViewController() -> UINavigationController? {
        let rootVC = UIViewController.currentSceneDelegate?.window?.rootViewController as? UINavigationController
        return rootVC
    }
}

extension UIView {
    func removeAllSubViews() {
        self.subviews.forEach({ $0.removeFromSuperview()} )
    }
}
