//
//  SectionHeader.swift
//  Teste Santander
//
//  Created by THIAGO on 09/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation


class SectionHeader: Section {
    var item: UserItem
    
    init(item: UserItem) {
        self.item = item
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        return HeaderCellView.self
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let cell = cell as? HeaderCellView {
            cell.setup(with: item)
        }
    }
}
