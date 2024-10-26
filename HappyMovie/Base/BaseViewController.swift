//
//  BaseViewController.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import Foundation
import SwiftUI

class BaseViewController<Content: View>: BaseHostingViewController<AnyView>, UIGestureRecognizerDelegate {
    init(rootView: Content) {
        let view = rootView
            .blackBackground()
            .eraseToAnyView()
        
        super.init(shouldShowNavigationBar: false, rootView: view)
    }
    
    required dynamic public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}
