//
//  SplashView.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        ZStack {
            Image.splash
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .viewDidLoad {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                Application.share.navigator?.setChooseSoundViewController()
            })
        }
    }
}
