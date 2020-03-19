//
//  UserDataView.swift
//  BankApp
//
//  Created by José Inácio Athayde Ferrarini on 17/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import UIKit

let separator = " / "

class UserDataView: XibView {
    
    // MARK: - Outlets

    @IBOutlet weak private(set) var userNameLabel: UILabel!
    @IBOutlet weak private(set) var userAccountLabel: UILabel!
    @IBOutlet weak private(set) var balanceLabel: UILabel!

    // MARK: - Public variables
    
    var onExit: (() -> ()) = {}
    
    // MARK: - Initialization

    override open func setupView() {
    }

    // MARK: - Setup
    
    func configure(with data: UserDataModel) {
        userNameLabel.text = data.name
        userAccountLabel.text = data.agency + separator + data.bankAccount
        balanceLabel.text = data.balance.asCurrency() ?? ""
    }
    
    // MARK: - Actions
    
    @IBAction func logoff() {
        onExit()
    }
    
}
