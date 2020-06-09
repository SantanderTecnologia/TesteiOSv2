//
//  StatementsTableViewCell.swift
//  Williamberg Bank
//
//  Created by padrao on 24/05/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//

import UIKit

class StatementsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var baseView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    let grayColor = UIColor(red: 168 / 255, green: 180 / 255, blue: 196 / 255, alpha: 1.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.backgroundColor = UIColor.white
        baseView.layer.shadowColor = UIColor.black.cgColor
        baseView.layer.shadowRadius = 5
        baseView.layer.shadowOpacity = 0.5
        titleLabel.textColor = grayColor
        dateLabel.textColor = grayColor
    }
}
