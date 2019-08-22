//
//  HomeDataSource.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

class HomeDataSource: NSObject {
    private var presenter: HomePresenter
    
    init(presenter: HomePresenter) {
        self.presenter = presenter
    }
}

extension HomeDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: InfoCell.self, indexPath: indexPath)
        cell.configure(statement: presenter.statements[indexPath.row])
        return cell
    }
}

extension HomeDataSource {
    class func setupHome(tableView: UITableView?) {
        tableView?.registerNib(cellClass: InfoCell.self)
    }
}
