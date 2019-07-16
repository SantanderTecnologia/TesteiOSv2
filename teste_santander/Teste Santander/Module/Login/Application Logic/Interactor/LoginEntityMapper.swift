//
//  LoginEntityMapper.swift
//  Teste Santander
//
//  Created by THIAGO on 03/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class LoginEntityMapper {
    
    static func create(model: UserModel) -> LoginEntity {
        let entity = LoginEntity()
        entity.agency = model.agency
        entity.balance = model.balance
        entity.bankAccount = model.bankAccount
        entity.name = model.name
        entity.userID = model.userID
        return entity
    }
}
