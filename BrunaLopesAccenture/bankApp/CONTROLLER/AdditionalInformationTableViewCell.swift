//
//  InformacoesAdicionais_TableViewCell.swift
//  bankApp
//
//  Created by bruna.lopes.d.santos on 12/07/19.

//  Copyright © 2019 bruna.lopes.d.santos. All rights reserved.
//

import UIKit

class AdditionalInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var outTitle: UILabel!
    
    @IBOutlet weak var outDescription: UILabel!
    
    @IBOutlet weak var outDate: UILabel!
    
    @IBOutlet weak var outValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func relacionaLabelWithStruct (with link: Extract) {
    
    outTitle.text = link.title
    outDescription.text = link.description
    outDate.text = link.date
    outValue.text = "R$ \(link.value)"
        
    }
    
}
