//
//  StatementResponse.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 10/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

struct StatementResponse: Codable {
    
    var statementList: [Statement]
    var error: Error
    
}

struct Statement: Codable {
    
    var title: String
    var desc: String
    var date: String
    var value: Float
    
}
