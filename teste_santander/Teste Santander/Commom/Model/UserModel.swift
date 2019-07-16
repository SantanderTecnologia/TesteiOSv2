//
//  UserModel.swift
//  Teste Santander
//
//  Created by THIAGO on 03/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import ObjectMapper

class UserModel: Mappable {
    var userID: Int = 0
    var name: String = ""
    var bankAccount:  String = ""
    var agency:  String = ""
    var balance:  Float = 0
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        userID  <- map["userAccount.userId"]
        name    <- map["userAccount.name"]
        bankAccount  <- map["userAccount.bankAccount"]
        agency  <- map["userAccount.agency"]
        balance  <- map["userAccount.balance"]
    }
}
