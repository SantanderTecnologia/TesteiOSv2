//
//  AccountDetailModels.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 26/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

enum AccountDetail {
    // MARK: Use cases
    
    struct Request {
        let id: Int
    }
    struct Response: Decodable {
        let statementList: [StatementList]?
        let error: ResultError?
    }
    struct ViewModel {
        let errorMsg: String?
    
        init(error: ResultError? = nil) {
            errorMsg = error?.message
        }
    }
    
    enum TableViewModel {
        struct Section {
            let name: String
            let account: String
            let balance: String
            
            init(user: UserAccount? = nil) {
                name = user?.name ?? ""
                account = "\(user?.bankAccount ?? "0") / \(user?.agency ?? "0")"
                balance = user?.balance?.convertToCurrency() ?? "R$"
            }
        }
        struct Cell {
            let type: String
            let description: String
            let date: String
            let value: String
            
            init(statment: StatementList? = nil) {
                type = statment?.title ?? ""
                description = statment?.desc ?? ""
                date = statment?.date?.formatDate() ?? ""
                value = statment?.value?.convertToCurrency() ?? "-"
            }
        }
    }
    
}

// MARK: - StatementList
struct StatementList: Decodable {
    let title, desc, date: String?
    let value: Double?
}
