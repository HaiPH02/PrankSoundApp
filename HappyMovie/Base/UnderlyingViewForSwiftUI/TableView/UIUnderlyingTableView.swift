//
//  UIUnderlyingTableView.swift
//  HappyMovie
//
//  Created by Hai Pham on 21/10/2024.
//

import Foundation
import UIKit

class UIUnderlyingTableView: UITableView,
                             UITableViewDelegate,
                             UITableViewDataSource {
    
    // MARK: - Public
    var data: [any GenericSection] = []
    var buildCellForRow: ((UITableView, IndexPath) -> UITableViewCell)?
    var didSelectRowAt: ((UITableView, IndexPath) -> Void)?
    
    var calcuteSỉzeForCell: ((UITableView, IndexPath) -> CGFloat)?
    var viewForHeader: ((UITableView, Int) -> UIView?)?
    var heightHeader: ((UITableView, Int) -> CGFloat)?
    
    
    
    // MARK: - Private
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        
        return layout
    }()
    
    // MARK: - Init
    init() {
        super.init(frame: .zero, style: .grouped)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func setupCollectionView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.separatorStyle = .none
        self.alwaysBounceVertical = true
        self.delegate = self
        self.dataSource = self
    }
    
    
    // MARK: - Delegate functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[safe: section]?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return buildCellForRow?(tableView, indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return calcuteSỉzeForCell?(tableView, indexPath) ?? UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        viewForHeader?(tableView, section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        heightHeader?(tableView, section) ?? UITableView.automaticDimension
    }
}
