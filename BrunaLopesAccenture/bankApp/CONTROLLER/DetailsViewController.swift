//
//  Detalhes_ViewController.swift
//  bankApp
//
//  Created by bruna.lopes.d.santos on 10/07/19.
//  Copyright © 2019 bruna.lopes.d.santos. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var user: User?
    var extractList: [Extract]?
    
    var api = ConnectionAPI()
    
    @IBOutlet weak var outName: UILabel!
    
    @IBOutlet weak var outCount: UILabel!
    
    @IBOutlet weak var outBalance: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func atcSair(_ sender: UIButton) {
        backToLogin()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = user {
            outName.text = user.name
            self.outCount.text = "\(user.count) / \(user.agency)"
            self.outBalance.text = "R$ \(user.balance)"
            
            api.searchExtract(userId: user.userId) { extractList in
                
                self.extractList = extractList
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AdditionalInformationTableViewCell {
            
            cell.relacionaLabelWithStruct(with: extractList![indexPath.row])
            return cell
            
        } else {
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = "Recentes"
        return title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return extractList!.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func backToLogin(){
        navigationController?.popViewController(animated: true)
    }
}

