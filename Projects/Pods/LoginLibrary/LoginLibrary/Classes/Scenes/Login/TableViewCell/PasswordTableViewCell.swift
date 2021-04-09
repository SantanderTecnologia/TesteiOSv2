//
//  PasswordTableViewCell.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit
import WorkersLibrary

public
class PasswordTableViewCell: UITableViewCell
{
      @IBOutlet public var passwordTxT: UITextField!
      {
            didSet
            {
                  passwordTxT.placeholder = "   Senha    "
            }
      }
      
      public override func awakeFromNib()
      {
            super.awakeFromNib()
            
            initAwakeFromNib()
      }
      
      public override func prepareForReuse()
      {
            super.prepareForReuse()
      }
      
      public override func setSelected(_ selected: Bool, animated: Bool)
      {
            super.setSelected(selected, animated: animated)
      }
      
      func initAwakeFromNib()
      {
            passwordTxT.layer.borderColor = uiColorGray.cgColor
            passwordTxT.layer.borderWidth = 1.0
            passwordTxT.layer.cornerRadius = 9
            passwordTxT.clipsToBounds = true
      }
      
}
