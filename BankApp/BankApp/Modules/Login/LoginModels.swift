//
//  LoginModels.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

enum LoginModels {
    struct LoggedinUserEntity {
        let userId: Int
        let name: String
        let bankAccount: String
        let agency: String
        let balance: Float
        
        init?(userInfo: LoggedinUserStruct) {
            guard
                let id = userInfo.userId,
                let name = userInfo.name,
                let account = userInfo.bankAccount,
                let agency = userInfo.agency,
                let balance = userInfo.balance
                else { return nil }
            
            self.userId = id
            self.name = name
            self.bankAccount = account
            self.agency = agency
            self.balance = balance
        }
    }
    
    struct Response {
        var userInfo: LoggedinUserEntity
    }
    
    struct ViewModel {
        var userInfo: LoggedinUserEntity
    }
}
