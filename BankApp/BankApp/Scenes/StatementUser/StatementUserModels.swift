//
//  StatementUserModels.swift
//  BankApp
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import Foundation

enum StatementUser {
    
    enum FetchStatement {
        struct Request {
            var userId: Int
        }
        
        struct Response {
            var statements: [Statement]
        }
        
        struct ViewModel {
            var statements: [Statement]
        }
    }
}
