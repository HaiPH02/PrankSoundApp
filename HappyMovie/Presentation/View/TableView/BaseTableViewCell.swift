//
//  BaseTableViewCell.swift
//  HappyMovie
//
//  Created by Hai Pham on 22/10/2024.
//

import Foundation
import SwiftUI

class BaseTableViewCell<Content: View>: UITableViewCell {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.removeAllSubViews()
    }
    
    // MARK: - Functions
    
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
