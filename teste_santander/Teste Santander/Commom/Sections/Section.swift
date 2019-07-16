//
//  Section.swift
//  Teste Santander
//
//  Created by THIAGO on 09/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class Section: NSObject {
    
    var cellsSize: [String: CGSize] = [:]
    
    func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        return CollectionViewCell.self
    }
    
    func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {}
    
    func string(for cell: CollectionViewCell.Type, from indexPath: IndexPath) -> String {
        return "\(indexPath.section)-\(cell.identifier)"
    }
    
    func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
        return cellsSize[string(for: cell, from: indexPath)] ?? .zero
    }
    
    func setCell(_ cell: CollectionViewCell.Type, size: CGSize, for indexPath: IndexPath) {
        cellsSize[string(for: cell, from: indexPath)] = size
    }
    
    func didSelectCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {}
    
    func shouldHighlight(at indexPath: IndexPath) -> Bool {
        return false
    }
    
    func insetForSection() -> UIEdgeInsets {
        return .zero
    }
}
