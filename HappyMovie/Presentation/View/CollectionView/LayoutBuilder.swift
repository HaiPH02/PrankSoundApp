//
//  LayoutBuilder.swift
//  HappyMovie
//
//  Created by Hai Pham on 24/10/2024.
//

import Foundation
import UIKit

class LayoutBuilder {
    static func builderVerticalGridLayout(itemSize: NSCollectionLayoutSize,
                                          groupSize: NSCollectionLayoutSize,
                                          sectionContentInset: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20),
                                          conlumn: Int = 2) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: conlumn)
        group.interItemSpacing = .fixed(20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = sectionContentInset
        
        return section
    }
}
