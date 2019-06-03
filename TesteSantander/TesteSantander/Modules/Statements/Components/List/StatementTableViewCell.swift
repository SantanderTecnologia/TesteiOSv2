//
//  StatementTableViewCell.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 30/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupContainerView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(title: String, desc: String, date: String, value: String) {
        titleLabel.text = title
        descLabel.text = desc
        dateLabel.text = date
        valueLabel.text = value
    }
    
    fileprivate func setupContainerView() {
        containerView.layer.masksToBounds = false
        containerView.layer.cornerRadius = 6
        
        // Border
        containerView.layer.borderColor = UIColor.lightPeriwinkle30.cgColor
        containerView.layer.borderWidth = 1.0
        
        // Shadow
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowColor = UIColor.lightSkyBlue.cgColor
        containerView.layer.shadowRadius = 6
        containerView.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
}
