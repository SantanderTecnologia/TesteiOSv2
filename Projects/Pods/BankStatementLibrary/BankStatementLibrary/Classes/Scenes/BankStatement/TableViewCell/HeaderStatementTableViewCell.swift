//
//  HeaderStatementTableViewCell.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit

public
class HeaderStatementTableViewCell: UITableViewCell
{
      
      @IBOutlet public var titleLbL: UILabel!
      
      public override func awakeFromNib()
      {
            super.awakeFromNib()
      }
      
      public override func setSelected(_ selected: Bool, animated: Bool)
      {
            super.setSelected(selected, animated: animated)
      }
      
}
