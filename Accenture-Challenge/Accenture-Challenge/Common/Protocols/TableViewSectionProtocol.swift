//
//  TableViewSectionProtocol.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

protocol TableViewSectionProtocol {
    init(builders: [TableViewCellBuilderProtocol], tableView: UITableView)
    func numberOfRows() -> Int
    func heightForHeader() -> CGFloat
    func headerView() -> UIView?
    func cellHeightFor(indexPath: IndexPath) -> CGFloat
    func cellAt(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
}
