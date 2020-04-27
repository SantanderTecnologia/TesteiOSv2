//
//  StatementItemTableViewCell.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 25/04/20.
//  Copyright © 2020 Bank. All rights reserved.
//

import UIKit

class StatementItemTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var vwCard: UIView!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(_ statementItem:Home.StatementList.Statement) {
        
        let color = UIColor.init(red: 239.0/255.0, green: 241.0/255.0, blue: 242.0/255.0, alpha: 0.75).cgColor
        
        self.vwCard.clipsToBounds = false
        self.vwCard.layer.cornerRadius = 10
        self.vwCard.layer.borderColor = color
        self.vwCard.layer.borderWidth = 1
        
        self.vwCard.layer.masksToBounds = false
        self.vwCard.layer.shadowColor = color
        self.vwCard.layer.shadowOpacity = 1
        self.vwCard.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.vwCard.layer.shadowRadius = 5
        
        //Values
        self.lblType.text = statementItem.transaction
        self.lblName.text = statementItem.description
        self.lblDate.text = statementItem.date
        self.lblValue.text = statementItem.value
    }

}
