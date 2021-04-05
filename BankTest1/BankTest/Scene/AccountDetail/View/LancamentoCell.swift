//
//  LancamentoCell.swift
//  BankTest
//
//  Created by Jaber Vieira Da Silva Shamali on 05/04/21.
//

import UIKit

class LancamentoCell: UITableViewCell {
    
    @IBOutlet var titulo: UILabel!
    @IBOutlet var descricao: UILabel!
    @IBOutlet var data:UILabel!
    @IBOutlet var valor:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
