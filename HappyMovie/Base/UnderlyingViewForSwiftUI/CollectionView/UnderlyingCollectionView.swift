//
//  UnderlyingCollectionView.swift
//  HappyMovie
//
//  Created by Hai Pham on 23/10/2024.
//

import Foundation
import SwiftUI

struct UnderlyingCollectionView: UIViewRepresentable {
    // MARK: - Init
    init(data: [any GenericSection],
         extraSetting: ((UICollectionView) -> Void)? = nil,
         calculateSizeForCell: @escaping ((UICollectionView, IndexPath) -> CGSize),
         buildCellForItem: @escaping ((UICollectionView, IndexPath) -> UICollectionViewCell),
         buildForHeader: ((UICollectionView, IndexPath) -> UICollectionReusableView)? = nil,
         sizeForHeader: ((UICollectionView, IndexPath) -> CGSize)? = nil
    ) {
        self.data = data
        self.extraSetting = extraSetting
        self.calculateSizeForCell = calculateSizeForCell
        self.buildCellForItem = buildCellForItem
        self.buildForHeader = buildForHeader
        self.sizeForHeader = sizeForHeader
    }
    // MARK: - Private
    private let data: [any GenericSection]
    private let extraSetting: ((UICollectionView) -> Void)?
    private let calculateSizeForCell: ((UICollectionView, IndexPath) -> CGSize)?
    private let buildCellForItem: ((UICollectionView, IndexPath) -> UICollectionViewCell)?
    private let buildForHeader: ((UICollectionView, IndexPath) -> UICollectionReusableView)?
    private let sizeForHeader: ((UICollectionView, IndexPath) -> CGSize)?
    
    typealias UIViewType = UIUnderlyingCollectionView
    
    func makeUIView(context: Context) -> UIViewType {
        let collectionView = UIViewType()
        
        collectionView.data = data
        
        collectionView.calculateSizeForCell = calculateSizeForCell
        collectionView.buildCellForItem = buildCellForItem
        collectionView.buildForHeader = buildForHeader
        collectionView.sizeForHeader = sizeForHeader
        
        extraSetting?(collectionView)
        
        return collectionView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // update soon
        uiView.data = data
        uiView.reloadData()
    }
}
