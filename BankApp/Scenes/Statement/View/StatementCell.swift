//
//  StatementCell.swift
//  BankApp
//
//  Created by resource on 16/06/19.
//  Copyright © 2019 Gabriel Faustino. All rights reserved.
//

import Foundation
import UIKit

class StatementCell: UITableViewCell {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var transactionType: UILabel!
    @IBOutlet weak var transactionDate: UILabel!
    @IBOutlet weak var transactionDescription: UILabel!
    @IBOutlet weak var transactionValue: UILabel!
    
    func setup(from model: Statement.Transactions.TransactionViewModel){
        transactionType.text = model.title
        transactionDate.text = model.date.toString(withFormat: "dd/MM/yyyy")
        transactionDescription.text = model.description
        transactionValue.text = String(format: "R$ %.2f", model.value)
        setupView()
    }
    
    private func setupView() {
        shadowView.layer.shadowColor = #colorLiteral(red: 0.8509803922, green: 0.8862745098, blue: 0.9137254902, alpha: 1)
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 5)
        shadowView.layer.shadowRadius = 12
    }
}
