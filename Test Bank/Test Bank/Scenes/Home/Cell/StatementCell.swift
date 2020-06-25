//
//  StatementCell.swift
//  Test Bank
//
//  Created by Lucas Santana Brito on 24/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import UIKit

class StatementCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var backview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateUI(statement: Home.Statement) {
        titleLabel.text = statement.title
        descriptionLabel.text = statement.desc
        dateLabel.text = statement.date.formatDate
        valueLabel.text = "R$ \(statement.value)"
        setupBackView()
    }
    
    func setupBackView() {
        
        backview.layer.shadowColor = UIColor(red: 217.0/255, green: 226.0/255, blue: 233.0/255, alpha: 1.0).cgColor
        backview.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        backview.layer.shadowOpacity = 0.9
        backview.layer.shadowRadius = 6.0
        
        backview.layer.cornerRadius = 6.0
        
    }
    
}
