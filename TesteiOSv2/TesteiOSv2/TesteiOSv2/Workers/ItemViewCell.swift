//
//  ItemViewCell.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 10/02/21.
//

import UIKit

class ItemViewCell: UITableViewCell {

    
 
   
    @IBOutlet weak var vwCell: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if (vwCell != nil) {
            let screenWidth = UIScreen.main.bounds.size.width
            
            vwCell.translatesAutoresizingMaskIntoConstraints = true
          
            vwCell.frame = CGRect(x: 0, y: 0, width: (screenWidth - 32), height: 80)
         
            vwCell.center = CGPoint(x: screenWidth / 2, y: contentView.bounds.midY)

            let myColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
  
            vwCell.backgroundColor = .white
            vwCell.layer.shadowOpacity = 1
            vwCell.layer.shadowRadius = 10
            vwCell.layer.shadowOffset = CGSize(width: 0, height: 0)
            vwCell.layer.shadowColor = myColor.cgColor
            vwCell.clipsToBounds = false
            
            vwCell.layer.cornerRadius = 8
            vwCell.layer.masksToBounds = false
        }

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
