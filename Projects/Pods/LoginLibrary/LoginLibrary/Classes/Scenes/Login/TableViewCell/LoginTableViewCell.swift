//
//  LoginTableViewCell.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit

public
class LoginTableViewCell: UITableViewCell
{
            
      @IBOutlet public  var loginBtN: UIButton!
      {
            didSet
            {
                  loginBtN.layer.cornerRadius = 9
                  loginBtN.clipsToBounds = true
            }
      }
      
      public override func awakeFromNib()
      {
            super.awakeFromNib()
      }
      
      public override func setSelected(_ selected: Bool, animated: Bool)
      {
            super.setSelected(selected, animated: animated)
      }

}
