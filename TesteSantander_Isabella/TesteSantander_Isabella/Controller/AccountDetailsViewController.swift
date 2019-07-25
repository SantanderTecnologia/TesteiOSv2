//
//  AccountDetailsViewController.swift
//  TesteSantander_Isabella
//
//  Created by isabella.bitencourt on 23/07/19.
//  Copyright © 2019 isabella.bitencourt. All rights reserved.
//

import UIKit

class AccountDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserAccount: UILabel!
    @IBOutlet weak var lblUserBalance: UILabel!
    
    @IBOutlet weak var tvStatementsList: UITableView!
    
    var user: User?
    let api = BankAPI()
    var bankStatements: [BankStatements]?
    
    @IBAction func btnLogout(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = user {
            lblUserName.text = user.userName
            self.lblUserAccount.text = " \(user.userAgency) / \(user.userBankAccount)"
            self.lblUserBalance.text = "R$ \(user.userAccountBalance)"
            
            api.findBankStatementsList(userID: user.userId){ statements in
                self.bankStatements = statements
                self.tvStatementsList.delegate = self
                self.tvStatementsList.dataSource = self
                self.tvStatementsList.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bankStatements!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "statementCell", for: indexPath) as? BankStatementTableViewCell{
            cell.prepare(with: bankStatements![indexPath.row])
            return cell
        }
        else{
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recentes"
    }
    
    
}
