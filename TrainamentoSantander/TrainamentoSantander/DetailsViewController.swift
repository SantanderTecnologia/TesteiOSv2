//
//  DetailsViewController.swift
//  TrainamentoSantander
//
//  Created by matheus.p.souza on 10/07/19.
//  Copyright © 2019 matheus.p.souza. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblConta: UILabel!
    @IBOutlet weak var lblSaldo: UILabel!
    
    @IBOutlet weak var tableViewDetalhes: UITableView!
    
    var users : Usuario?
    var statment : [StatementList]?
    
    var servico = Api()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = users {
            lblNome.text = user.name
            self.lblConta.text = "\(user.bankAccount) /\(user.agency)"
            self.lblSaldo.text = "\(user.balance)"
            
            servico.statementsRequest(userID: user.userId) { statements in
                self.statment = statements
                self.tableViewDetalhes.delegate = self
                self.tableViewDetalhes.dataSource = self
                self.tableViewDetalhes.reloadData()
            }
        }
    }
    
    @IBAction func exit(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension DetailsViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statment!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExtratoCell", for: indexPath) as! ExtratoTableViewCell
        
        cell.prepare(with: statment![indexPath.row])
        
        return cell
    }
}

extension DetailsViewController: UITableViewDelegate {
    
}

