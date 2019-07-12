//
//  File.swift
//  TrainamentoSantander
//
//  Created by matheus.p.souza on 10/07/19.
//  Copyright © 2019 matheus.p.souza. All rights reserved.
//

import UIKit

class ExtratoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func prepare(with stat: StatementList)
    {
        lblTitle.text = stat.title
        lblDesc.text = stat.desc
        lblDate.text = stat.date
        lblValue.text = "\(stat.value.currencyBR)"
    }
    
}
