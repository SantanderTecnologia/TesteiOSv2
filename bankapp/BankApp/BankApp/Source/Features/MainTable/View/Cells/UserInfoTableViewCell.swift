//
//  UserInfoTableViewCell.swift
//  BankApp
//
//  Created by Pedro Veloso on 21/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    weak var delegate: Logoutable?

    @IBOutlet weak var userNameLabel: UILabel! {
        didSet {
            userNameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
            userNameLabel.textColor = .white
        }
    }
    @IBOutlet weak var logoutButton: UIButton! {
        didSet {
            logoutButton.setTitle("", for: .normal)
        }
    }
    @IBOutlet weak var accountPlaceholder: UILabel! {
        didSet {
            accountPlaceholder.font = UIFont.preferredFont(forTextStyle: .caption1)
            accountPlaceholder.textColor =  .white
            accountPlaceholder.text = "Conta"
        }
    }
    @IBOutlet weak var accountLabel: UILabel! {
        didSet {
            accountLabel.font = UIFont.preferredFont(forTextStyle: .body)
            accountLabel.textColor = .white
        }
    }
    @IBOutlet weak var balancePlaceholder: UILabel! {
        didSet {
            balancePlaceholder.font = UIFont.preferredFont(forTextStyle: .caption1)
            balancePlaceholder.textColor = .white
            balancePlaceholder.text = "Saldo"
        }
    }
    @IBOutlet weak var balanceLabel: UILabel! {
        didSet {
            balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
            balanceLabel.textColor = .white
        }
    }
    
    @IBAction func logout() {
        delegate?.logout()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .purple
    }

    func setup(user: String?, account: String?, balance: String?, delegate: Logoutable?) {
        userNameLabel.text = user
        accountLabel.text = account
        balanceLabel.text = balance
        self.delegate = delegate
    }
    
}
