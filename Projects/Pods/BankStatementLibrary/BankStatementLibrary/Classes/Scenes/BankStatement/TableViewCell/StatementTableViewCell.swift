//
//  StatementTableViewCell.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit
import WorkersLibrary

public
class StatementTableViewCell: UITableViewCell
{
      
      @IBOutlet public var statementV: UIView!
      
      @IBOutlet public var titleLbL: UILabel!
      @IBOutlet public var dateLbL: UILabel!
      @IBOutlet public var descriptionLbL: UILabel!
      @IBOutlet public var valueLbL: UILabel!
      
      public override func awakeFromNib()
      {
            super.awakeFromNib()
            
            initAwakeFromNib()
      }
      
      public override func setSelected(_ selected: Bool, animated: Bool)
      {
            super.setSelected(selected, animated: animated)
      }
      
      public func initAwakeFromNib()
      {
            statementV.layer.shadowColor = uiColorLightGray.cgColor
            statementV.layer.shadowOpacity = 1
            statementV.layer.shadowOffset = .zero
            statementV.layer.shadowRadius = 9
      }
      
}
