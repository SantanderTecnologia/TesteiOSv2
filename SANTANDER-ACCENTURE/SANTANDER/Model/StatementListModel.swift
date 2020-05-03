//
//  StatementList.swift
//  SANTANDER
//
//  Created by Maíra Preto on 23/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import Foundation

//// MARK: - Welcome
struct ApiResponse: Codable {
    
    
    let statementList: [StatementList]?
    let error: Error?
}
//
//// MARK: - Error
struct Error: Codable {
}

// MARK: - StatementList
struct StatementList: Codable {
    let title, desc, date: String?
    let value: Double?
}



