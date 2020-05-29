//
//  HomeViewController.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 16/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var accountAndAgency: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var walletTableView: UITableView!
    
    
    // MARK: - Variables
    var loginResponse: LoginResponse?
    var userRequest = UserRequest()
    var modelData: [StatementList] = []
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        walletTableView.delegate = self
        walletTableView.dataSource = self
        
        guard let responses = loginResponse else { return }
        
        name.text! = responses.userAccount.name
        accountAndAgency.text! = "\(responses.userAccount.agency) / \(responses.userAccount.bankAccount)"
        balance.text! = "\(responses.userAccount.balance)"
        
        // MARK: - Get Request
        userRequest.getSaving(endpoint: Constants.String.wallet, completion: { result in
            switch result {
            case.success(let wallet):
                
                print("The following message has been sent \(wallet.statementList.description)")
                self.modelData = wallet.statementList
                
                DispatchQueue.main.async {
                    self.walletTableView.reloadData()
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "qualquerTeset", for: indexPath) as? WalletTableViewCell else {
            
            
            return UITableViewCell()
        }
        cell.insertData(data: modelData[indexPath.row])
        
        return cell
    }
    
    
    @IBAction func logoutTapped() {
        let loginViewController = LoginViewController()
               
               navigationController?.popToRootViewController(animated: false)
    }
    
    
}

