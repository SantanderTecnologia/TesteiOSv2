//
//  DetallhesViewController.swift
//  DesafioBankSantander
//
//  Created by fabiana.c.almeida on 7/14/19.
//  Copyright © 2019 b. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var tbView: UITableView!
    @IBAction func btnClose(_ sender: UIButton) {
        closeScreenDetails()
    }
    
    var client:  Client?
    var movesList: [Moves]? //Armazenar a Lista de lancamento
    var storesAPI = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = client {
            nameLabel.text = user.name
            self.accountLabel.text = " ag: \(user.agency) cc: \(user.account)"
            self.balanceLabel.text = "Balance: \(user.balance)"
            storesAPI.requestLaunch(userId: user.userId) { response in
                self.movesList = response
                self.tbView.delegate = self
                self.tbView.dataSource = self
                self.tbView.reloadData()
                }            
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movesList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let chamacell = tableView.dequeueReusableCell(withIdentifier: "extract", for: indexPath) as? ExtractTableViewCell{
            chamacell.prepare(with: movesList![indexPath.row])
            return chamacell 
        }
        else{
            fatalError()
        }
    }
    
    func closeScreenDetails() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier:
            "ScreenLoginViewController") as? ScreenLoginViewController {
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

