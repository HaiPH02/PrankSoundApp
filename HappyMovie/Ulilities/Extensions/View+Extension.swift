//
//  View+Extension.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import SwiftUI

extension View {
    
    var uiView: UIView {
        let view = UIHostingController(rootView: self).view
        return view ?? UIView()
    }
    
    @ViewBuilder
    func blackBackground() -> some View {
        self
            .backgroundColor(.white)
    }
    
    @ViewBuilder
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
    
    @ViewBuilder
    func viewDidLoad(initState: @escaping () async -> Void) -> some View {
        self
            .modifier(ViewDidLoadModifier(initState: initState))
    }
    
    @ViewBuilder
    func backgroundColor(_ color: Color) -> some View {
        self
            .background(color)
    }
}

