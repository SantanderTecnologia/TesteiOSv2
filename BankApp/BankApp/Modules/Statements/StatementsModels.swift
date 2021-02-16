//
//  StatementsModels.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

enum StatementsModels {
    
    struct Response {
        var statementsList: [StatementStruct]
    }
    
    struct ViewModel {
        struct StatementViewModel {
          var title: String
          var description: String
          var date: String
          var value: String
        }
        
        var statements: [StatementViewModel]
        var numStatements: Int { return statements.count }
        
        func at(_ index: Int) -> StatementViewModel {
            return statements[index]
        }
    }
    
    struct UserInfoResponse {
        var info: LoginModels.LoggedinUserEntity
    }
    
    struct UserInfoViewModel {
        let name: String
        let account: String
        let balance: String
    }
}
