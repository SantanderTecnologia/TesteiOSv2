//
//  StatementModels.swift
//  BankApp
//
//  Created by resource on 16/06/19.
//  Copyright (c) 2019 Gabriel Faustino. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Statement {
    enum User {
        struct Request { }
        struct Response { }
        
        struct ViewModel {
            let id: Int
            let name: String
            let bankAccount: String
            let agency: String
            let balance: Double
            
            init?(from model: Login.User.UserAccount) {
                id = model.userId
                name = model.name
                bankAccount = model.bankAccount
                agency = model.agency
                balance = model.balance
            }
        }
    }
    
    enum Transactions {
        struct Request { }
        
        struct Response: Codable {
            let statementList: [Transaction]
        }
        
        struct Transaction: Codable {
            let title: String
            let description: String
            let date: String
            let value: Double
            
            enum CodingKeys: String, CodingKey {
                case title = "title"
                case description = "desc"
                case date = "date"
                case value = "value"
            }
        }
        
        struct ViewModel {
            let transationList: [TransactionViewModel]
        }
        
        struct TransactionViewModel {
            let title: String
            let description: String
            let date: Date
            let value: Double
            
            init?(from model: Statement.Transactions.Transaction) {
                guard let modelDate = model.date.toDate(withFormat: "yyyy-MM-dd") else { return nil }
                date = modelDate
                
                title = model.title
                description = model.description
                value = model.value
            }
        }
    }
}
