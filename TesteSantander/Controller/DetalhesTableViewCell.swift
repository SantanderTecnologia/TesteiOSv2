//
//  DetalhesTableViewCell.swift
//  TesteSantander
//
//  Created by bianca.butti.almeida on 11/07/19.
//  Copyright © 2019 bianca.butti.almeida. All rights reserved.
//

import UIKit

class DetalhesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titulo: UILabel!
    
    @IBOutlet weak var descricao: UILabel!
    @IBOutlet weak var data_calendario: UILabel!
    @IBOutlet weak var valorEmReais: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare (with transacao: Transacao){
        titulo.text = transacao.titulo
        descricao.text = transacao.descricao
        data_calendario.text = transacao.data
        valorEmReais.text = "\(transacao.valor)"
    }

}
