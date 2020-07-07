//
//  PaymentsFactory.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

class PaymentsFactory: TableViewFactoryProtocol {
    
    private var viewModel: Payments.Info.ViewModel.Payment?
    private let tableView: UITableView
    
    init(viewModel: Payments.Info.ViewModel.Payment,
         tableView: UITableView) {
        self.viewModel = viewModel
        self.tableView = tableView
    }
    
    func buildSections() -> [TableViewSectionProtocol] {
        return [mainSection]
    }
    
    private var mainSection: TableViewSectionProtocol {
        var builders: [PaymentsTableViewCellBuilder] = []
        guard let models = viewModel?.model else { return BaseSection(builders: [], tableView: tableView)}
        for payment in models {
            let builder = PaymentsTableViewCellBuilder(viewModel: payment)
            builders.append(builder)
        }
        return PaymentsSection(builders: builders, tableView: tableView)
    }
}
