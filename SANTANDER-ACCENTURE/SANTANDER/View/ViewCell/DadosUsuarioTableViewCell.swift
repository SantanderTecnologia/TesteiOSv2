//
//  DadosClienteTableViewCell.swift
//  SANTANDER
//
//  Created by Maíra Preto on 11/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import UIKit

protocol LogoutBtnDelegate: class {
    func logoutBtnTapped()
}


class DadosUsuarioTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nomeLabel: UILabel!
    
    @IBOutlet weak var dadosContaLabel: UILabel!
    
    @IBOutlet weak var saldoLabel: UILabel!
    
    weak var delegate: LogoutBtnDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dadosContaLabel.text = ""
        nomeLabel.text = ""
        saldoLabel.text = ""
        
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        self.delegate?.logoutBtnTapped()
        
    }
    
    func setupCell(value: UserAccount?) {
        
        self.nomeLabel.text = value?.name
        
        if let agency = value?.agency, let bank = value?.bankAccount {
            self.dadosContaLabel.text = "\(agency)/\(bank)"
        }
        self.saldoLabel.text = "R$" + " " + (String(format: "%.2f", value?.balance ?? 0.00))
    }
}


