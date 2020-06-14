//
//  StatementsTableViewCell.swift
//  TesteiOSv2
//
//  Created by Foliveira on 11/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import UIKit

class StatementsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cellView.layer.cornerRadius = 8
        cellView.layer.shadowOffset = CGSize.zero
        cellView.layer.shadowRadius = 3
        cellView.layer.shadowOpacity = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(statement: Statement){
        typeLabel.text = statement.title
        dateLabel.text = statement.date.formatDate()
        descLabel.text = statement.desc
        valueLabel.text = "R$\(String(format:"%.2f", statement.value))"
    }
    
}
