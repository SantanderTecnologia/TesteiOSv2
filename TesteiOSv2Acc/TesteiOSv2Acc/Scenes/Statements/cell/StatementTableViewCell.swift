//
//  StatementTableViewCell.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 26/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    static let identifier = "StatementTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func load(data: StatementData)
    {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        dateLabel.text = data.date
        valueLabel.text = data.value
    }
    
}

struct StatementData
{
    let title: String
    let description: String
    let date: String
    let value: String
}
