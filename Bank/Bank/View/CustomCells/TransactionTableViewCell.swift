//
//  TransactionTableViewCell.swift
//  Bank
//
//  Created by Junior Obici on 13/01/20.
//  Copyright © 2020 Junior Obici. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    //MARK: - Componentes
    @IBOutlet weak var viewTransaction: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelValue: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Prepare
    func prepareTransactionCell(with transaction: Transaction) {
        labelTitle.text = transaction.title
        labelDesc.text = transaction.desc
        labelDate.text = transaction.date.toShortDate
        labelValue.text = Decimal(transaction.value).Currency
     }
}
