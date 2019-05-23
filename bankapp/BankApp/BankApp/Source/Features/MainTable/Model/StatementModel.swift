//
//  StatementModel.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

struct StatementModel: Codable {
    let title: String
    let desc: String
    let date: String
    let value: Double
}

extension StatementModel: Equatable {
    static func == (lhs: StatementModel, rhs: StatementModel) -> Bool {
        return lhs.title == rhs.title &&
            lhs.desc == rhs.desc &&
            lhs.date == rhs.date &&
            lhs.value == rhs.value
    }
}
