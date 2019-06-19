//
//  AccountModels.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 17/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation

enum Account {
    struct UserAccountFormatted {
        var name: String
        var agencyBankAccount: String
        var saldo: String
        
        init(name: String, agencyBankAccount: String, saldo: String) {
            self.name = name
            self.agencyBankAccount = agencyBankAccount
            self.saldo = saldo
        }
    }
    struct Statement: Decodable {
        let title: String
        let desc: String
        let date: String
        let value: Float
    }
    struct Response: Decodable {
        var statementList: [Statement]?
    }
}
