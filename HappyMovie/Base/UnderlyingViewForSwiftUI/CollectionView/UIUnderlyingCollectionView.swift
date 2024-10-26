//
//  UIUnderlyingCollectionView.swift
//  HappyMovie
//
//  Created by Hai Pham on 22/10/2024.
//

import Foundation
import SwiftUI

class UIUnderlyingCollectionView: UICollectionView,
                                  UICollectionViewDelegate,
                                  UICollectionViewDataSource,
                                  UICollectionViewDelegateFlowLayout
{
    
    var data: [any GenericSection] = []
    var extraSetting: ((UICollectionView) -> Void)?
    var calculateSizeForCell: ((UICollectionView, IndexPath) -> CGSize)?
    var buildCellForItem: ((UICollectionView, IndexPath) -> UICollectionViewCell)?
    var buildForHeader: ((UICollectionView, IndexPath) -> UICollectionReusableView)?
    var sizeForHeader: ((UICollectionView, IndexPath) -> CGSize)?
    var didSelectItem: ((UICollectionView, IndexPath) -> Void)?
    
    
    // MARK: -Private
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout.init()
        return layout
    }()
    
    
    // MARK: - Init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollectionView()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: self.layout)
        setupCollectionView()
    }
    
    // MARK: - Functions
    func setupCollectionView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.delegate = self
        self.dataSource = self
    }
    
    // MARK: Delegate functions
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[safe: section]?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        buildCellForItem?(collectionView, indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        calculateSizeForCell?(collectionView, indexPath) ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItem?(collectionView, indexPath)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 13
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 13
//    }
}
