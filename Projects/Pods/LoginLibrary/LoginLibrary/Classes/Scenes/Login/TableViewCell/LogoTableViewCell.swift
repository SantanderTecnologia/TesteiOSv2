//
//  LogoTableViewCell.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit

public
class LogoTableViewCell: UITableViewCell
{

      @IBOutlet public var LogoImGV: UIImageView!
      
      public override func awakeFromNib()
      {
        super.awakeFromNib()
    }

      public override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
}
