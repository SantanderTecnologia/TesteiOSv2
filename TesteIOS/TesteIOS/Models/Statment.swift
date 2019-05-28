//
//  Statment.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 22/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import ObjectMapper

class Statments: Mappable, Equatable {
    static func == (lhs: Statments, rhs: Statments) -> Bool {
        return lhs.statmentList! == rhs.statmentList!
    }
    
    var statmentList: [Statment]?

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        statmentList <- map["statementList"]
    }
}

class Statment: Mappable, Equatable {
    static func == (lhs: Statment, rhs: Statment) -> Bool {
        return lhs.title == rhs.title && lhs.desc == rhs.desc && lhs.date == rhs.date && lhs.value == rhs.value
    }
    
    var title: String?
    var desc: String?
    var date: String?
    var value: String?

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        let transform = TransformOf<String, Double>(fromJSON: { (value: Double?) -> String? in

            if let v = value {
                return v.toCurrency()
            }
            return nil
        }, toJSON: { (value: String?) -> Double? in
            // transform value from Double? to String?
            if let value = value {
                return Double(value)
            }
            return nil
        })

        title <- map["title"]
        desc <- map["desc"]
        date <- map["date"]
        value <- (map["value"], transform)
    }

    func print() -> String {
        let text = "Statments: title=\(title), desc=\(desc), data=\(date), value=\(value)"
        return text
    }
}
