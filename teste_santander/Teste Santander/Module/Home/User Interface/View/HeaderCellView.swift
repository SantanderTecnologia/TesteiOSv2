//
//  HeaderCellView.swift
//  Teste Santander
//
//  Created by THIAGO on 09/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class HeaderCellView: CollectionViewCell {

    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var bankAccountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        widthConstraint.constant = UIScreen.main.bounds.width
        layoutIfNeeded()
    }
    
    @IBAction func send(_ sender: Any) {
        delegate?.didTap()
    }
    
    func setup(with user: UserItem) {
        nameLabel.text = user.name
        balanceLabel.text = user.balance.currencyBRL
        bankAccountLabel.text = maskAgency(agency: user.agency, bankAccount: user.bankAccount)
    }
    
     func maskAgency(agency: String, bankAccount: String) -> String {
        var characters = Array(agency)
        characters.insert(".", at: 2)
        characters.insert("-", at: 9)
        let agencybank = "\(bankAccount) / \(String(characters))"
        return agencybank
    }
}

