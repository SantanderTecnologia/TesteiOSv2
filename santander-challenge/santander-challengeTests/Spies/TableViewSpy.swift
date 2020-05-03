//
//  TableViewSpy.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 03/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import UIKit

class TableViewSpy: UITableView {
    var reloadDataCalled = false

    override func reloadData() {
        reloadDataCalled = true
    }
}
