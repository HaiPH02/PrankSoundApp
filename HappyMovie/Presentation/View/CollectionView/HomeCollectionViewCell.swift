//
//  HomeCollectionViewCell.swift
//  HappyMovie
//
//  Created by Hai Pham on 23/10/2024.
//

import Foundation
import SwiftUI

class HomeCollectionViewCell: BaseCollectionViewCell<HomeCell> {
    func setup(menu: Menu) {
        setupView(content: HomeCell(menu: menu))
    }
}

struct HomeCell: View {
    
    let menu: Menu
    
    var body: some View {
        GeometryReader(content: { proxy in
            VStack {
                menu.image.image
                    .resizable()
                    .scaledToFit()
                Text(menu.name)
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .foregroundColor(.white)
            }
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
            .backgroundColor(Color(hex: menu.backgroundTitle))
            .cornerRadius(21)
        })
        
    }
}
