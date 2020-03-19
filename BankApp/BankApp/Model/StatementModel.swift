//
//  StatementModel.swift
//  BankApp
//
//  Created by José Inácio Athayde Ferrarini on 19/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Foundation

struct StatementModel: Codable {
    
    let title: String
    let desc: String
    let date: String
    let value: Double
    
}
