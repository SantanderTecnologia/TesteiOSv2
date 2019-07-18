//
//  TableViewCell2.swift
//  Desafio_Santander
//
//  Created by fernanda.pereira on 14/07/19.
//  Copyright © 2019 fernanda.pereira. All rights reserved.
//


import Foundation
import UIKit

class tableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareOutlets(with statement: Transactions){
        lblTitle.text = statement.title
        lblDescription.text = statement.description
        lblDate.text = statement.date
        lblValue.text = "R$ \(statement.value)"
        
    }
    
}
