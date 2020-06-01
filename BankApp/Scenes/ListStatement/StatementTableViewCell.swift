//
//  StatementTableViewCell.swift
//  BankApp
//
//  Created by Lynneker Souza on 5/29/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var shadowView: UIView!
    
    var statement: ListStatement.FetchStatement.ViewModel.DisplayedStatement! {
        didSet {
            titleLabel.text = statement.title
            dateLabel.text = statement.date
            descLabel.text = statement.desc
            valueLabel.text = statement.value
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.shadowView.layer.cornerRadius = 4
        self.shadowView.applyShadow()
    }
}
