//
//  HomeView.swift
//  HappyMovie
//
//  Created by Hai Pham on 18/10/2024.
//

import Foundation
import SwiftUI

struct HomeView: View {

    @StateObject
    var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            headerView
                .padding(.horizontal, 20)
            gridView
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .viewDidLoad {
            viewModel.getMenuItems()
        }
    }
}

extension HomeView {
    private var headerView: some View {
        HStack {
            Spacer()
            Text("Menu")
                .font(.system(size: 24, weight: .heavy))
            Spacer()
            Image.setting
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .onTapGesture {
                    viewModel.plusMenu()
                }
            
        }
        .frame(height: 48)
    }
    
    private var gridView: some View {
        UnderlyingCollectionView(data: viewModel.menuSection,
                                 extraSetting: { collectionView in
            collectionView.collectionViewLayout = buildCompositeLayout()
            collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.className)
        },
                                 calculateSizeForCell: { collectionView, section in
                .zero
        },
                                 buildCellForItem: { collectionView, indexPath in
            let section = viewModel.menuSection[indexPath.section]
            let data = section.data[indexPath.row]
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.className, for: indexPath) as? HomeCollectionViewCell,
                  let menu = data as? SingleCell<Menu> else {
                return UICollectionViewCell()
            }
            cell.contentView.backgroundColor = .yellow
            cell.setup(menu: menu.model)
            
            return cell
        })
    }
}

extension HomeView {
    private func buildCompositeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section: Int, enviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let width = enviroment.container.contentSize.width
            let cellWidth = (width - 20 * 3) / 2
            let layoutSection = LayoutBuilder.builderVerticalGridLayout(itemSize: .init(widthDimension: .fractionalWidth(1 / 2),
                                                                                        heightDimension: .fractionalHeight(1)),
                                                                        groupSize: .init(widthDimension: .fractionalWidth(1),
                                                                                         heightDimension: .absolute(168)),
                                                                        conlumn: 2)
            return layoutSection
        }
        return layout
    }
}
