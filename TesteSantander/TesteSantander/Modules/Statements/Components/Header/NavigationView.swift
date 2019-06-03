//
//  NavigationView.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 30/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import UIKit

class NavigationView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    
    fileprivate var name: String!
    fileprivate var statementsLogoutViewController: StatementsLogoutViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(name: String, statementsLogoutViewController: StatementsLogoutViewController) {
        nameLabel.text = name
        self.statementsLogoutViewController = statementsLogoutViewController
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        statementsLogoutViewController.logout()
    }
    
}
