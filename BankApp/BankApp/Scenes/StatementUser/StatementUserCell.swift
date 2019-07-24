//
//  StatementUserCell.swift
//  BankApp
//
//  Created by Visão Grupo on 23/07/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import UIKit

class StatementUserCell: UITableViewCell {
    
    // MARK: @IBOutlets
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
