//
//  AccountModels.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright (c) 2020 bank. All rights reserved.

import UIKit

enum Account
{
    struct Request {
        var accountId: Int
    }

    struct Response: Codable {
        var statementList: [Statement]
    }

    class ViewModel {

        private var statement: Statement

        init(statement: Statement) {
            self.statement = statement
        }

        var title: String {
            return self.statement.title.capitalized
        }

        var description: String {
            return self.statement.description.capitalized
        }

        var dateTransaction: String {
            return self.statement.dateTransaction?.toString(to: "dd/MM/yyyy") ?? "-"
        }

        var value: String {
            return self.statement.value.toCurrency()
        }
    }
}

struct Statement: Codable {
    var title: String
    var description: String
    var dateTransaction: Date?
    var value: Double
}

extension Statement {

    enum CodingKeys: String, CodingKey {
        case title
        case description = "desc"
        case dateTransaction = "date"
        case value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        value = try container.decode(Double.self, forKey: .value)
        if let date = try? container.decode(String.self, forKey: .dateTransaction) {
            dateTransaction = date.toDate(from: "yyyy-MM-dd")
        }
    }
}
