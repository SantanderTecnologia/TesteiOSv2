//
//  StatementTableController.swift
//  BankApp
//
//  Created by resource on 16/06/19.
//  Copyright © 2019 Gabriel Faustino. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Delegate & Datasource Protocols
protocol StatementTableDataSource: class {
    func statementTableDataSource(_ statementTable: StatementTableController, numberOfRowsInSection section: Int) -> Int
    func planOptionCollection(_ statementTable: StatementTableController, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

class StatementTableController: UITableViewController {
    weak var dataSource: StatementTableDataSource?
    
    func register(nib: UINib, forCellWithReuseIdentifier: String){
        tableView.register(nib, forCellReuseIdentifier: forCellWithReuseIdentifier)
    }
    
    func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    func reloadData(){
        tableView.reloadData()
    }
}

// MARK: - TableView Methods
extension StatementTableController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.statementTableDataSource(self, numberOfRowsInSection: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource?.planOptionCollection(self, cellForRowAt: indexPath) ?? UITableViewCell()
    }
}
