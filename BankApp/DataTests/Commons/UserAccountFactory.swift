//
//  UserAccountFactory.swift
//  DataTests
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Presenter
import Domain

var userAccountModel: UserAccountModel {
    return .init(identifier: "1", name: "name_any", bankAccount: "bankAccount_any", agency: "agency_any", balance: 0.0)
}

var userAccountResponse: UserAccountResponse {
    return .init(userAccount: .init(userID: 1, name: "name_any", bankAccount: "bankAccount_any", agency: "agency_any", balance: 0.0),
                 authError: .init())
    
}

