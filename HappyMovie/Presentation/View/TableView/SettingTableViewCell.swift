//
//  SettingTableViewCell.swift
//  HappyMovie
//
//  Created by Hai Pham on 21/10/2024.
//

import Foundation
import SwiftUI

class SettingTableViewCell: BaseTableViewCell<SettingCell> {
    func setup() {
        setupView(content: SettingCell(image: "panda",
                                       title: "Sample Text"))
    }
}

struct SettingCell: View {
    
    let image: String
    let title: String
    
    var body: some View {
        HStack {
            image.image
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
             Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(Color.darkLiver)
                .padding(.horizontal, 12)
            Spacer()
        }
        .frame(height: 48)
        .padding(.horizontal, 20)
        .backgroundColor(.cultured)
        .cornerRadius(16)
        .padding(.bottom, 15)
    }
}
