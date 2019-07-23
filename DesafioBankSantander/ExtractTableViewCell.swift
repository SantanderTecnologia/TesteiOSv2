//
//  ExtratoTableViewCell.swift
//  DesafioBankSantander
//
//  Created by fabiana.c.almeida on 7/16/19.
//  Copyright © 2019 b. All rights reserved.
//

import UIKit

class ExtractTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func prepare (with extract: Moves) {
        //funcao p/ preparar label (atribuir valores)
        titleLabel.text = extract.title
        valueLabel.text = "\(extract.value)" //converte qualquer var p/ String
        dateLabel.text = extract.date
        descriptionLabel.text = extract.desc
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
