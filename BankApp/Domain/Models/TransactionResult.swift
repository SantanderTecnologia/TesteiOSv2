//
//  TransactionResult.swift
//  Domain
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public struct TransactionResult: BaseModel {
    public let uuid = UUID()
    public let statementList: [StatementList]
    public let error: AuthError
    
    public init (statementList: [StatementList],  error: AuthError) {
        self.statementList = statementList
        self.error = error
    }
    
    public static func == (lhs: TransactionResult, rhs: TransactionResult) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

public struct StatementList: BaseModel {
    public let title: String
    public let desc: String
    public let date: String
    public let value: Double
    
    public init(title: String, desc: String, date: String, value: Double) {
        self.title = title
        self.desc = desc
        self.date = date
        self.value = value
    }
}
