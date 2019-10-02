//
//  StatementUser.swift
//  BankApp
//
//  Created by Marcus Titton on 20/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import Foundation

//Campos que voltam da API / statementList
struct StatementUser: Decodable {
    var title: String
    var desc: String
    var date: String
    var value: Double
    
    init(title: String, desc: String, date: String, value: Double) {
        self.title = title
        self.desc = desc
        self.date = date
        self.value = value
    }
}
