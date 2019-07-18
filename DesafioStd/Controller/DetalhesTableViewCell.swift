//
//  DetalhesTableViewCell.swift
//  DesafioStd
//
//  Created by bianca.dos.s.sobral on 17/07/19.
//  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
//

import UIKit

class DetalhesTableViewCell: UITableViewCell {

    @IBOutlet weak var pagamento: UILabel!
    @IBOutlet weak var conta: UILabel!
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var custo: UILabel!
    
    var bancoApi: Bancologin?
    var transacoes: [Transacao]?
    
    func transacaoConexao( movimentacao: Transacao) {
        
        pagamento.text = movimentacao.title
        conta.text = movimentacao.desc
        data.text = movimentacao.date
        custo.text = "\(movimentacao.value)"
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

    


