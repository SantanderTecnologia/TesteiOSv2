//
//  StatementTableViewCell.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 15/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {
    static let identifier = "statementCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func setStatement(statement: Statement) {
        titleLabel.text = statement.title
        descriptionLabel.text = statement.description
        dateLabel.text =  statement.date!.convertoToDate(input: "yyyy-MM-dd", output: "dd/MM/yyyy")
        valueLabel.text = statement.value?.changeCurrency()!
    }
}
