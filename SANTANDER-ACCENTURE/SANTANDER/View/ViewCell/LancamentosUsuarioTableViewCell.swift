//
//  LancamentosUsuarioTableViewCell.swift
//  SANTANDER
//
//  Created by Maíra Preto on 11/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import UIKit

class LancamentosUsuarioTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var descricaoLabel: UILabel!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var valorLabel: UILabel!
    
    @IBOutlet weak var celulaView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        celulaView.layer.shadowColor = UIColor.lightGray.cgColor
        celulaView.layer.shadowOffset = CGSize(width: 2, height: 2)
        celulaView.layer.shadowOpacity = 0.5
        celulaView.layer.shadowRadius = 5
    }
    
    func set(list: StatementList) {
        
        self.tituloLabel.text = list.title
        self.descricaoLabel.text = list.desc
        self.dataLabel.text = String.dateFromCustomString(customString: list.date ?? "")
        
        if Int(list.value ?? 0) < 0 {
            valorLabel.textColor = UIColor.red
        } else {
            valorLabel.textColor = UIColor.darkGray
        }
        
        valorLabel.text = "R$" + " " + String(format:"%.2f", list.value ?? "")
        
        
    }
}
