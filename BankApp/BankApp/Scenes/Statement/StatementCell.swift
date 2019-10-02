//
//  StatementCell.swift
//  BankApp
//
//  Created by Marcus Titton on 20/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import UIKit

//Criação de classe para célula dinamica da tela de extrato
class StatementCell: UITableViewCell {

    //Inicialização de campos da célula com base no storyboard
    @IBOutlet weak var txt_titulo: UILabel!
    @IBOutlet weak var txt_descricao: UILabel!
    @IBOutlet weak var txt_data: UILabel!
    @IBOutlet weak var txt_valor: UILabel!
    
}
