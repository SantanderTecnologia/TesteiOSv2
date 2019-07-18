//
//  DetalhesViewController.swift
//  DesafioStd
//
//  Created by bianca.dos.s.sobral on 17/07/19.
//  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var usuario: Usuario?
    var transacao: [Transacao]?
    
    let movimentacao : Movimentacao = BancoMovimentacao()
    let bancoLogin = Bancologin()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        if let user = usuario {
            nomeInput.text = user.name
            self.contaInput.text = "\(user.conta)"
            self.saldoInput.text = String(format: "R$: %.02f", saldo)
            
            transacaoRede(userIdTransacoes: user.userId)
            
        }
        
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
    }
    
    func transacaoRede(userIdTransacoes: Int){
        movimentacao.transacoes(userId:userIdTransacoes) { tra in
            self.transacao = tra
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nomeInput: UILabel!
    @IBOutlet weak var conta: UILabel!
    @IBOutlet weak var contaInput: UILabel!
    @IBOutlet weak var saldo: UILabel!
    @IBOutlet weak var saldoInput: UILabel!
    
    @IBAction func logOut (sender: UIButton)
    {
        func btnLogOut(){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if storyboard.instantiateViewController(withIdentifier: "PrincipalViewController") is PrincipalViewController{
                self.navigationController? .popViewController(animated: true)
            }
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transacao!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellExtrato", for: indexPath) as! DetalhesTableViewCell
        
        
        
        cell.prepareForReuse()
        
        return cell
        
    }
}



