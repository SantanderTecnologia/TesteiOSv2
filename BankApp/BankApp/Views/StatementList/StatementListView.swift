//
//  StatementListView.swift
//  BankApp
//
//  Created by José Inácio Athayde Ferrarini on 17/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import UIKit

let reuseIdentifier = StatementListCell.simpleClassName()

class StatementListView: XibView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var userDataView: UserDataView!
    @IBOutlet weak var statementsTableView: UITableView!
    
    // MARK: - Public variables
    
    var onExit: (() -> ()) = {} {
        didSet {
            userDataView.onExit = onExit
        }
    }
    
    var statements: [StatementModel] = [] {
        didSet {
            statementsTableView.reloadData()
        }
    }
    
    // MARK: - Initialization

    override open func setupView() {
        let cellNib = UINib(nibName: reuseIdentifier, bundle: nil)
        statementsTableView.register(cellNib, forCellReuseIdentifier: reuseIdentifier)
        statementsTableView.register(StatementListHeader.self, forHeaderFooterViewReuseIdentifier: StatementListHeader.simpleClassName())
        statementsTableView.reloadData()
    }
    
    // MARK: - Setup
    
    func configure(with data: StatementListViewModel) {
        let userData = data.userData
        userDataView.configure(with: userData)
    }
    
}

extension StatementListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? StatementListCell else { return UITableViewCell() }

        let viewModel = statements[indexPath.row]
        cell.configure(with: viewModel)
        
        return cell
    }
    
}

extension StatementListView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: StatementListHeader.simpleClassName()) as?  StatementListHeader else { return UIView() }
        view.titleLabel.text = "Recentes"
        return view
    }
    
}
