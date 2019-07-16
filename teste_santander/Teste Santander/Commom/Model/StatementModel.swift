//
//  StatementModel.swift
//  Teste Santander
//
//  Created by THIAGO on 09/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import ObjectMapper

class StatementModel: Mappable {
    var date: Date = Date()
    var desc: String = ""
    var title: String = ""
    var value: Float = 0
    
    required init?(map: Map) {}
    
     func mapping(map: Map) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        date <- (map["date"], DateFormatterTransform(dateFormatter: formatter))
        desc <- map["desc"]
        title <- map["title"]
        value <- map["value"]
    }
    
}

