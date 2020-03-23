//
//  StatementsTableViewCell.swift
//  BankApp
//
//  Created by apple on 23/03/20.
//  Copyright © 2020 Barbara_Aniele. All rights reserved.
//

import UIKit

class StatementsTableViewCell: UITableViewCell {
  
  @IBOutlet weak var shadowView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var descricaoLabel: UILabel!
  @IBOutlet weak var valueLabel: UILabel!
  
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
  }
  
  func configureCell(cellInfo: Statements?) {
    shadowView.dropShadow()
    if let _ = cellInfo?.value {
      titleLabel.text = cellInfo?.title
      dateLabel.text = cellInfo?.date?.toDate()?.toString()
      descricaoLabel.text = cellInfo?.desc
      valueLabel.text = cellInfo?.value?.formatCurrency(valor: cellInfo?.value! as! NSNumber)
    }
  }
    
}
