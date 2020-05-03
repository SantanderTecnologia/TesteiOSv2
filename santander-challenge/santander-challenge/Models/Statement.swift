//
//  Statement.swift
//  santander-challenge
//
//  Created by Kevin Oliveira on 02/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import Foundation
import SwiftyJSON

class Statement {
    var title: String
    var description: String
    var date: Date
    var value: Float

    init(title: String, description: String, date: Date, value: Float) {
        self.title = title
        self.description = description
        self.date = date
        self.value = value
    }

    static func fromJSON(json: JSON) -> Statement {
        return Statement(
            title: json["title"].stringValue,
            description: json["desc"].stringValue,
            date: json["date"].stringValue.toDate(),
            value: json["value"].floatValue
        )
    }
}

extension Statement: Equatable {
    static func == (lhs: Statement, rhs: Statement) -> Bool {
        let equalTitles = lhs.title == rhs.title
        let equalDescriptions = lhs.description == rhs.description
        let equalDates = lhs.date == rhs.date
        let equalValues = lhs.value == rhs.value

        return equalTitles && equalDescriptions && equalDates && equalValues
    }
}
