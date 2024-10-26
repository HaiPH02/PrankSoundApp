//
//  FavoritePrankSoundView.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import Foundation
import SwiftUI

struct FavoritePrankSound: View {
    
    @StateObject
    var viewModel: FavoritePrankSoundViewModel
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Choose your favorite prank sound")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
            
            VStack(spacing: 15) {
                ForEach($viewModel.favoritePrankSounds) { favoretePrankSound in
                    FavoretePrankSoundItem(favoretePrankSound: favoretePrankSound)
                        .onTapGesture {
                            viewModel.modifySelectingGenres(code: favoretePrankSound.wrappedValue.code)
                        }
                }
            }
        }
        .onAppear {
            viewModel.mockData()
        }
    }
}

extension FavoritePrankSound {
}
