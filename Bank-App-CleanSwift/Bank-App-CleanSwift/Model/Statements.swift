//
//  Statements.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import Foundation

// MARK: - Data from GET request

/// Struct for fetching statement list from JSO
struct StatementListData: Decodable {
    let statementList: [StatementData]
    let error: ErrorData
    
    enum CodingKeys: String, CodingKey {
        case statementList
        case error
    }
        
    struct StatementData: Decodable {
        let title: String?
        let description: String?
        let date: String?
        let totalAmount: Double?
        
        enum CodingKeys: String, CodingKey {
            case title
            case description = "desc"
            case date
            case totalAmount = "value"
        }
    }
    
    struct ErrorData: Decodable {
        let code: Int?
        let message: String?
        
        enum CodingKeys: String, CodingKey {
            case code
            case message
        }
    }
}

// MARK: - POSO (plain old swift objects)

/// A `Statement` object, which contains a kind of transaction in a given day
struct Statement {
    let title: String
    let description: String
    let date: String
    let totalAmount: String    
}
