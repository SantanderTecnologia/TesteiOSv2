//
//  StatementTableViewCell.swift
//  TesteiOSv2Project
//
//  Created by Andrey on 15/06/20.
//  Copyright © 2020 Andrey Matos. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "StatementTableViewCell"
    @IBOutlet weak var titleUILabel: UILabel!
    @IBOutlet weak var descUILabel: UILabel!
    @IBOutlet weak var dateUILabel: UILabel!
    @IBOutlet weak var valueUILabel: UILabel!
    
    
    func setup(displayedStatement: UserBalance.FetchStatements.ViewModel.DisplayedStatement){
        titleUILabel.text = displayedStatement.title
        descUILabel.text = displayedStatement.desc
        dateUILabel.text = displayedStatement.date
        valueUILabel.text = displayedStatement.value
    }

}
