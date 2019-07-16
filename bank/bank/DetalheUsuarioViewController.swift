//
//  DetalheUsuarioViewController.swift
//  bank
//
//  Created by mayara.da.s.andrade on 10/07/19.
//  Copyright © 2019 mayara.da.s.andrade. All rights reserved.
//

import UIKit

class DetalheUsuarioViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var lista: UITableView!
    
    @IBOutlet weak var nome: UILabel!
    
    @IBOutlet weak var conta: UILabel!
    
    @IBOutlet weak var saldo: UILabel!
    
    var usuario : Usuario?
    var api = BancoAPI()
    var Movimentacao : [Status]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let user = usuario {
            nome.text = user.name
            self.conta.text = "ag: \(user.agencia) cc: \(user.conta)"
            self.saldo.text = "Saldo: \(user.saldo)"
            
            api.status(userId: user.userId){ Movimentacao in
                self.Movimentacao = Movimentacao
                self.lista.delegate =  self
                self.lista.dataSource =  self
                self.lista.reloadData()
               
            }
        }

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Movimentacao!.count
        // quantidade de itens que tem dentro do diciionario
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let tableViewController = tableView.dequeueReusableCell(withIdentifier: "TableViewController", for: indexPath) as? DetalhesCellTableViewCell{
            
        tableViewController.prepare(with: Movimentacao![indexPath.row])
        return tableViewController
        }
        else{
            fatalError()
        }
    }

  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
