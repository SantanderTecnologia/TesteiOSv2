//
//  DetalhesCellTableViewCell.swift
//  bank
//
//  Created by mayara.da.s.andrade on 16/07/19.
//  Copyright © 2019 mayara.da.s.andrade. All rights reserved.
//

import UIKit

class DetalhesCellTableViewCell: UITableViewCell {
    @IBOutlet weak var descricao: UILabel!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var valor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with movimentacao: Status){
        descricao.text = movimentacao.desc
        titulo.text = movimentacao.title
        data.text = movimentacao.date
        valor.text = "RS\( movimentacao.value)"
        
    }

}
