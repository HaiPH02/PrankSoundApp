//
//  HomeViewModel.swift
//  HappyMovie
//
//  Created by Hai Pham on 23/10/2024.
//

import Foundation
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    
    init(navigator: HomeNavigatorProtocol) {
        self.navigator = navigator
    }
    
    private var navigator: HomeNavigatorProtocol
    
    private let menuList = [
        Menu(image: "Item1", name: "Sample Text", backgroundTitle: "FBD69D"),
        Menu(image: "Item2", name: "Sample Text", backgroundTitle: "96D8FF"),
        Menu(image: "Item3", name: "Sample Text", backgroundTitle: "D3B5F7"),
        Menu(image: "Item4", name: "Sample Text", backgroundTitle: "FFB39E"),
        Menu(image: "Item5", name: "Sample Text", backgroundTitle: "8ED873"),
        Menu(image: "Item6", name: "Sample Text", backgroundTitle: "FBD69D"),
    ]
    
    @Published
    var menuSection: [Section] = []
        
    func getMenuItems() {
        self.menuSection = [
            Section(title: "", data: menuList.map({ SingleCell(model: $0) }), typeCell: .nomal)
        ]
    }
    
    func plusMenu() {
        self.menuSection.append(Section(title: "", data: menuList.map({ SingleCell(model: $0) }), typeCell: .ads))
    }
    
    struct Section: GenericSection {
        var title: String
        var data: [any Cell]
        
        var typeCell: TypeCell
    }
    
    enum TypeCell {
        case nomal
        case ads
    }
    
}
