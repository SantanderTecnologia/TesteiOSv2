//
//  ExtratoRecente.swift
//  bankApp
//
//  Created by bruna.lopes.d.santos on 12/07/19.
//  Copyright © 2019 bruna.lopes.d.santos. All rights reserved.
//

import Foundation

struct ExtractRec: Codable {
    let information: [Extract]
    
    enum CodingKeys: String, CodingKey {
        case information = "statementList"
    }
}

struct Extract: Codable {
    let title: String
    let description: String
    let date: String
    let value: Double
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "desc"
        case date
        case value
    }
}
