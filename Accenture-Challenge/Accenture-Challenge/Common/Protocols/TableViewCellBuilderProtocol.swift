//
//  TableViewCellBuilder.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

protocol TableViewCellBuilderProtocol {
    func registerCell(in tableView: UITableView)
    func cellHeight() -> CGFloat
    func cellAt(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
}
