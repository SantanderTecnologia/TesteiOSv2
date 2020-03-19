//
//  HomeTableViewCell.swift
//  TesteiOSv2
//
//  Created by Mônica Marques on 12/03/20.
//  Copyright © 2020 Mônica Marques. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(value: Statements?) {
        
        self.containerView.layer.masksToBounds = false
        self.containerView.layer.shadowColor = UIColor.lightGray.cgColor
        self.containerView.layer.shadowOpacity = 0.1
        self.containerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.containerView.layer.shadowRadius = 1

        self.containerView.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.containerView.layer.shouldRasterize = true
        self.containerView.layer.rasterizationScale = 1
        
       
        if let _value = value, let date = _value.date?.toDate() {
            self.titleLabel.text = _value.title
            self.descLabel.text = _value.desc
            self.dateLabel.text = date.toString()
            self.valueLabel.text = "R$\(_value.value ?? 0)"
            
        }
        
    }
    
}
