//
//  UserDetails.swift
//  Desafio_Santander
//
//  Created by fernanda.pereira on 10/07/19.
//  Copyright © 2019 fernanda.pereira. All rights reserved.
//

import UIKit

class UserDetails: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
    
  
    
    
    @IBOutlet weak var lblNomeUser: UILabel!
    @IBOutlet weak var lblAgenciaConta: UILabel!
    @IBOutlet weak var lblSaldo: UILabel!
    @IBOutlet weak var tvUserStatement: UITableView!
 
    @IBAction func btnGoBack(_ sender: Any) {
        goBack()
    }
    var userDetails: Usuario?
    var userStatement =  requestDetails()
    var statementList: [Transactions]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        if let user = userDetails {
            lblNomeUser.text = user.name
            self.lblAgenciaConta.text = "\(user.agencia)/\(user.conta)"
            self.lblSaldo.text = "R$\(user.saldo)"
            
            userStatement.showDetails(userId: user.userId){ statementList in
                self.statementList = statementList
                self.tvUserStatement.delegate = self
                self.tvUserStatement.dataSource = self
                self.tvUserStatement.reloadData()
        }
    }
        
        
    }
    func tableView(_ tableViewStatement: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let statementCell = tableViewStatement.dequeueReusableCell(withIdentifier: "SCell", for: indexPath) as? tableViewCell{
        
        statementCell.prepareOutlets(with: statementList![indexPath.row])
        return statementCell
    }
        else{
         fatalError()
    }
}
    func tableView(_ tvUserStatement: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = "Recentes"
        return title
    }
    func tableView(_ tvUserStatement: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statementList!.count
    }
    
    func numbersOfSectionInTableView(tvUserStatement: UITableView) -> Int {
        return 1
    }

    
    
    func goBack(){
        navigationController?
            .popViewController(animated: true)
    }
    }

    

