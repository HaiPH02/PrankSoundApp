//
//  UnderlyingTableView.swift
//  HappyMovie
//
//  Created by Hai Pham on 21/10/2024.
//

import Foundation
import SwiftUI

struct UnderlyingTableView: UIViewRepresentable {
    
    init(data: [any GenericSection],
         extraSetting: ((UITableView) -> Void)? = nil,
         calcuteSỉzeForCell: ((UITableView, IndexPath) -> CGFloat)? = nil,
         buildCellForRow: ((UITableView, IndexPath) -> UITableViewCell)? = nil,
         didSelectRowAt: ((UITableView, IndexPath) -> Void)? = nil,
         viewForHeader: ((UITableView, Int) -> UIView?)? = nil,
         heightHeader: ((UITableView, Int) -> CGFloat)? = nil
    ) {
        self.data = data
        self.buildCellForRow = buildCellForRow
        self.calcuteSỉzeForCell = calcuteSỉzeForCell
        self.extraSetting = extraSetting
        self.didSelectRowAt = didSelectRowAt
        self.viewForHeader = viewForHeader
        self.heightHeader = heightHeader
    }
    
    private let data: [any GenericSection]
    private var calcuteSỉzeForCell: ((UITableView, IndexPath) -> CGFloat)?
    private var buildCellForRow: ((UITableView, IndexPath) -> UITableViewCell)?
    private let extraSetting: ((UITableView) -> Void)?
    private let didSelectRowAt: ((UITableView, IndexPath) -> Void)?
    private let viewForHeader: ((UITableView, Int) -> UIView?)?
    private let heightHeader: ((UITableView, Int) -> CGFloat)?
    
    func makeUIView(context: Context) -> UIViewType {
        let collectionView = UIViewType()
        collectionView.data = data
        extraSetting?(collectionView)
        collectionView.buildCellForRow = buildCellForRow
        collectionView.calcuteSỉzeForCell = calcuteSỉzeForCell
        collectionView.viewForHeader = viewForHeader
        collectionView.heightHeader = heightHeader
        collectionView.didSelectRowAt = didSelectRowAt
        
        return collectionView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    typealias UIViewType = UIUnderlyingTableView
    
    
}
