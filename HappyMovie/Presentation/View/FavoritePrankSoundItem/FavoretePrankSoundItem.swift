//
//  FavoretePrankSoundItem.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import Foundation
import SwiftUI

struct FavoretePrankSoundItem: View {
    
    @Binding
    var favoretePrankSound: PrankSoundCode
    
    var body: some View {
        HStack {
            favoretePrankSound.image.image
                .resizable()
                .scaledToFill()
                .frame(width: 28, height: 28)
                .padding(.horizontal, 12)

            Text(favoretePrankSound.title)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .regular))
            Spacer()
            Button(action: {
                
            }, label: {
                let image = favoretePrankSound.isSelected ? Image.selected : Image.unselected
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .padding(.horizontal, 12)

            })
        }
        .frame(height: 48)
        .background {
            (favoretePrankSound.isSelected ? Color(hex: "#7EB454") : Color(hex: "#333333"))
                .cornerRadius(8)
        }
        .padding(.horizontal, 16)
    }
}

