//
//  ExtratoTableViewCell.swift
//  BankApp
//
//  Created by Victor Lisboa on 19/09/19.
//  Copyright © 2019 Victor Lisboa. All rights reserved.
//

import UIKit

class ExtratoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
