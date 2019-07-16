//
//  StatementSection.swift
//  Teste Santander
//
//  Created by THIAGO on 09/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class StatementSection: Section {
    var item: StatementItem
    
    init(item: StatementItem) {
        self.item = item
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        return StatementViewCell.self
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let cell = cell as? StatementViewCell {
          cell.setup(display: StatementDisplay.make(item: item))
        }
    }
}
