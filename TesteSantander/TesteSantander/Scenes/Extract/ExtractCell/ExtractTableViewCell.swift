//
//  ExtractTableViewCell.swift
//  TesteSantander
//
//  Created by Hugo Abolis Jordao on 13/06/19.
//  Copyright © 2019 Hugo Abolis Jordao. All rights reserved.
//

import UIKit

class ExtractTableViewCell: UITableViewCell {
    
    @IBOutlet weak var paymentTitleLabel: UILabel!
    @IBOutlet weak var paymentDateLabel: UILabel!
    @IBOutlet weak var paymentNameLabel: UILabel!
    @IBOutlet weak var paymentAmountLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.1
        shadowView.layer.shadowOffset = CGSize(width: -1, height: 0)
        shadowView.layer.shadowRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    public func configureCell(title: String, date: String, name: String, amount: String){
        paymentDateLabel.text = date
        paymentNameLabel.text = name
        paymentAmountLabel.text = amount
        paymentTitleLabel.text = title
    }
}
