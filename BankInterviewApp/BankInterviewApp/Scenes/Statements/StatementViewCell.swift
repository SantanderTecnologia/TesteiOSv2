//
//  StatementViewCell.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import UIKit

class StatementViewCell: UITableViewCell {
    
    @IBOutlet weak var transaction: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var value: UILabel!
    
    func configure(model: Statements.StatementList.Statement) {
        transaction.text = model.transaction
        date.text = model.date
        descriptionLbl.text = model.description
        value.text = model.value
    }
    
}
