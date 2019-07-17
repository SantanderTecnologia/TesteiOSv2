//
//  SegundaViewController.swift
//  TesteSantander
//
//  Created by bianca.butti.almeida on 09/07/19.
//  Copyright © 2019 bianca.butti.almeida. All rights reserved.
//

import UIKit

class SegundaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var lblNomeConta: UILabel!
    @IBOutlet weak var lblSaldoAtual: UILabel!
    @IBOutlet weak var lblNumeroDaConta: UILabel!
    
    @IBOutlet weak var tableViewInfos: UITableView!
    
    var usuario: Usuario?
    var transacao : [Transacao] = []
    let api = TransacaoAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = usuario{
            lblNomeConta.text = user.name
            self.lblNumeroDaConta.text = "Agencia: \(user.agencia)  CC: \(user.conta)"
            self.lblSaldoAtual.text = "R$\(user.saldo)"
            
            api.transacao(userId: user.userId){
                transacao in
                self.transacao = transacao
                self.tableViewInfos.reloadData()
            }
            
            
        }
      tableViewInfos.delegate = self
      tableViewInfos.dataSource = self
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let celula = tableView.dequeueReusableCell(withIdentifier: "linha", for: indexPath) as! DetalhesTableViewCell
    celula.prepare(with: transacao[indexPath.row])
    
     return celula
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transacao.count
    }
    
    
    
}
