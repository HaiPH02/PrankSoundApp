//
//  SettingView.swift
//  HappyMovie
//
//  Created by Hai Pham on 18/10/2024.
//

import Foundation
import SwiftUI

struct SettingView: View {
    
    struct Section: GenericSection {
        var title: String
        
        var data: [any Cell]
        
        
    }
    
    struct CellDummy: Cell {
        var image: String
        var title: String
    }
    
    var body: some View {
        VStack {
            header
            tableView
        }
        .padding(.horizontal, 20)
    }
}

extension SettingView {
    private var header: some View {
        HStack {
            Image.chevronRight
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
            
            Spacer()
            
            Text(String.setting)
                .foregroundColor(.blackOlive)
                .font(.system(size: 24, weight: .regular))
            
            Spacer()
        }
    }
    
    private var tableView: some View {
        UnderlyingTableView(data: [Section(title: "1",
                                           data: [CellDummy(image: "", title: ""),
                                                  CellDummy(image: "", title: ""),
                                                  CellDummy(image: "", title: ""),
                                                  CellDummy(image: "", title: ""),
                                                  CellDummy(image: "", title: "")
                                                 ]
                                          ),
                                   Section(title: "1",
                                           data: [CellDummy(image: "", title: ""),
                                                  
                                                  CellDummy(image: "", title: ""),
                                                  CellDummy(image: "", title: ""),
                                                  CellDummy(image: "", title: ""),
                                                  CellDummy(image: "", title: "")
                                                           ]
                                                    )],
                            extraSetting: { tableView in
            tableView.backgroundColor = .clear
            tableView.showsVerticalScrollIndicator = false
            tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.className)
        },
                            
                            buildCellForRow: { tableView, indexPath in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.className, for: indexPath) as? SettingTableViewCell
            else {
                return UITableViewCell()
            }
            
            cell.setup()
            return cell
            
        }, viewForHeader: { _, _ in
            let header = headerTableView.uiView
            return header
        })
    }
    
    private var headerTableView: some View {
        HStack {
            Text("HeaderTableView")
                .font(.system(size: 20, weight: .heavy))
                .foregroundColor(.black)
            Spacer()
        }
        .padding(.vertical, 12)
    }
}
