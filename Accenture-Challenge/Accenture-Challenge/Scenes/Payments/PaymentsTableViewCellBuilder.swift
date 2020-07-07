//
//  PaymentsTableViewCellBuilder.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

class PaymentsTableViewCellBuilder: TableViewCellBuilderProtocol {
    
    let viewModel: Payments.Info.PaymentModel
    
    init(viewModel: Payments.Info.PaymentModel) {
        self.viewModel = viewModel
    }
    
    func registerCell(in tableView: UITableView) {
        tableView.registerCell(cellType: PaymentsTableViewCell.self)
    }
    
    func cellHeight() -> CGFloat {
        return 104
    }
    
    func cellAt(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, type: PaymentsTableViewCell.self)
        cell.setup(viewModel: viewModel)
        
        return cell
    }
}
