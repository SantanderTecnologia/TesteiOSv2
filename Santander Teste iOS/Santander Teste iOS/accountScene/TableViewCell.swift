//
//  TableViewCell.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 17/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var value: UILabel!
    
    func fillData(statement: Account.Statement?) {
        if let statement = statement {
            self.title.text = statement.title
            self.desc.text = statement.desc
            self.date.text = statement.date
            self.value.text = String(format: "R$ %.02f", statement.value)
        }
    }
}
