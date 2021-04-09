//
//  EmailOrCPFTableViewCell.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit
import WorkersLibrary
import RxSwift

public
class EmailOrCPFTableViewCell: UITableViewCell
{
      
      @IBOutlet public var emailOrCPFTxTF: UITextField!
      {
            didSet
            {
                  if (defaults.value(forKey: "userEmailOrCPF") != nil)
                  {
                        userEmailOrCPF = defaults.string(forKey: "userEmailOrCPF")!
                        emailOrCPFTxTF.text = userEmailOrCPF
                  }
                  else
                  {
                        emailOrCPFTxTF.placeholder =  "   E-mail ou CPF   "
                  }
            }
      }
      
      public override func awakeFromNib()
      {
            super.awakeFromNib()
            
            initAwakeFromNib()
      }
      
      public override func setSelected(_ selected: Bool, animated: Bool)
      {
            super.setSelected(selected, animated: animated)
      }
      
      func initAwakeFromNib()
      {
            emailOrCPFTxTF.layer.borderColor = uiColorGray.cgColor
            emailOrCPFTxTF.layer.borderWidth = 1.0
            emailOrCPFTxTF.layer.cornerRadius = 9
            emailOrCPFTxTF.clipsToBounds = true
      }
      
}
