//
//  Movimenta_TableViewCell.swift
//  DesafioSantander
//
//  Created by daianne.gomes.aguiar on 08/07/19.
//  Copyright © 2019 daianne.gomes.aguiar. All rights reserved.
//

import UIKit

class Movimenta_TableViewCell: UITableViewCell {

    @IBOutlet weak var outDesc: UILabel!
    @IBOutlet weak var outValue: UILabel!
    @IBOutlet weak var outDate: UILabel!
    @IBOutlet weak var outTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func prepare(with extrato : Movimentacao)
    {
        outTitle.text! = extrato.tema
        outDesc.text! = extrato.desc
        outDate.text! = extrato.data
        outValue.text! = "\(String(format: "R$ %0.2f", extrato.valor))"
    }

}
