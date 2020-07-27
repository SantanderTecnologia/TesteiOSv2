//
//  StatementsTableViewCell.swift
//  TesteIOS
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

import UIKit

class StatementsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func populateCell(statement: Statement) {
        titleLabel.text = statement.title ?? ""
        descLabel.text = statement.desc ?? ""
        dateLabel.text = statement.date?.convertDataFormat() ?? ""
        valueLabel.text = statement.value?.currencyFormatted() ?? "R$ 0,00"
    }

}
