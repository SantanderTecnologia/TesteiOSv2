//
//  StatementsTableViewCell.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 08/04/19.
//  Copyright © 2019 Lucas Brandão Pereira. All rights reserved.
//

import UIKit

class StatementsTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var paymentName: UILabel!
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var paymentType: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
