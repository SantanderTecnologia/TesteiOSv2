//
//  TotalStatementTableViewCell.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit

public
class TotalStatementTableViewCell: UITableViewCell
{
      
      @IBOutlet public var nameLbL: UILabel!
      
      @IBOutlet public var logoutBtN: UIButton!
      
      @IBOutlet public var accountTitleLbL: UILabel!
      @IBOutlet public var accountNumberLbL: UILabel!
      
      @IBOutlet public var balanceTitleLbL: UILabel!
      @IBOutlet public var balanceLbL: UILabel!
      
      public override func awakeFromNib()
      {
            super.awakeFromNib()
      }
      
      public override func setSelected(_ selected: Bool, animated: Bool)
      {
            super.setSelected(selected, animated: animated)
      }
      
}
