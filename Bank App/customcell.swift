//
//  customcell.swift
//  Bank App
//
//  Created by Gustavo on 6/7/19.
//  Copyright © 2019 Gustavo Sousa. All rights reserved.
//

import UIKit

class customcell: UITableViewCell {
    
//Definição das variáveis UI
    @IBOutlet var pagamento: UILabel!
    @IBOutlet var tipopagamento: UILabel!
    @IBOutlet var data: UILabel!
    @IBOutlet var valor: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
