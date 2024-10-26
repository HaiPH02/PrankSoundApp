//
//  ViewDidLoadModifier.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import Foundation
import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    @State
    private var isFirstTime = true
    
    let initState: () async -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                Task { @MainActor in
                    if isFirstTime {
                        isFirstTime = false
                        await initState()
                    }
                }
            }
    }
}
