//
//  Statement.swift
//  TesteIOS
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

import Foundation

struct StatementList: Codable {
    let statementList: [Statement]?
    let error: Error?
}

struct Error: Codable { }

struct Statement: Codable {
    let title: String?
    let desc: String?
    let date: String?
    let value: Double?
}

extension StatementList {
    static func parse(responseData: Data?) -> StatementList? {
        var statements: StatementList?
        guard let data = responseData else { return statements }
        do {
            let decoder = JSONDecoder()
            statements = try decoder.decode(StatementList.self, from: data)
        } catch let err {
            print("Error: ", err)
        }
        
        return statements
    }
}
