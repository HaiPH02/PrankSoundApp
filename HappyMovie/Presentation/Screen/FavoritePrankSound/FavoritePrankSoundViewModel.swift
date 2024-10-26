//
//  FavoritePrankSoundViewModel.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import Foundation
import SwiftUI

class FavoritePrankSoundViewModel: ObservableObject {
    
    init(navigator: FavoritePrankSoundNavigatorProtocol) {
        self.navigator = navigator
    }
    
    private let navigator: FavoritePrankSoundNavigatorProtocol
    
    @Published
    var favoritePrankSounds: [PrankSoundCode] = []
    
    func mockData() {
        
        self.favoritePrankSounds = [
            PrankSoundCode(code: "1", title: "Sample text", image: "panda", isSelected: true),
            PrankSoundCode(code: "2", title: "Sample text", image: "panda", isSelected: false),
            PrankSoundCode(code: "3", title: "Sample text", image: "panda", isSelected: false),
            PrankSoundCode(code: "4", title: "Sample text", image: "panda", isSelected: false),
            PrankSoundCode(code: "5", title: "Sample text", image: "panda", isSelected: false),
            PrankSoundCode(code: "6", title: "Sample text", image: "panda", isSelected: false),
            PrankSoundCode(code: "7", title: "Sample text", image: "panda", isSelected: false),
            PrankSoundCode(code: "8", title: "Sample text", image: "panda", isSelected: false),
            PrankSoundCode(code: "9", title: "Sample text", image: "panda", isSelected: false)
        ]
    }
    
    func modifySelectingGenres(code: String) {
        if let index = favoritePrankSounds.firstIndex(where: {$0.code == code}) {
            let item = favoritePrankSounds[index]
            item.isSelected.toggle()
            favoritePrankSounds[index] = item
        }
    }
}
