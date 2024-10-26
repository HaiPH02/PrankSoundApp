//
//  BaseViewModel.swift
//  HappyMovie
//
//  Created by Hai Pham on 16/10/2024.
//

import Foundation
import Combine

class BaseViewModel<Output>: ObservableObject {
    
    init(state: Output) {
        self.state = state
        
    }
    
    var cancellables = Set<AnyCancellable>()
    
    @Published
    var state: Output
}
