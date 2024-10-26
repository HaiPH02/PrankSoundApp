//
//  BaseCollectionViewCell.swift
//  HappyMovie
//
//  Created by Hai Pham on 21/10/2024.
//

import Foundation
import SwiftUI

class BaseCollectionViewCell<Content: View>: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.contentView.removeAllSubViews()
    }
    
    // MARK: - Setup
    func setupView(content: Content) {
        let view = content.uiView
        view.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        view.layoutIfNeeded()
        layoutIfNeeded()
    }
}
