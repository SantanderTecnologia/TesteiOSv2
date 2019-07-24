//
//  Statement.swift
//  BankApp
//
//  Created by Visão Grupo on 7/22/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import Foundation

struct Statement: Decodable {
    
    var title: String
    var desc: String
    var date: String
    var value: Double
}
