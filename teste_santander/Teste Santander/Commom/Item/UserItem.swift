//
//  UserItem.swift
//  Teste Santander
//
//  Created by THIAGO on 04/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

struct UserItem {
    var userID: Int = 0
    var name: String = ""
    var bankAccount:  String = ""
    var agency:  String = ""
    var balance:  Float = 0
    
    static func make(loginEntenty: LoginEntity) -> UserItem {
        var item = UserItem()
        item.agency = loginEntenty.agency
        item.balance = loginEntenty.balance
        item.bankAccount = loginEntenty.bankAccount
        item.name = loginEntenty.name
        item.userID = loginEntenty.userID
        return item
    }
}


