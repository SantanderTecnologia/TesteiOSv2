//
//  Statement.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 14/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation
import ObjectMapper

class Statement: Mappable {
    var title: String?
    var description: String?
    var date: String?
    var value: Double?
    
    init(title: String, description: String,
         date: String, value: Double) {
        self.title = title
        self.description = description
        self.date = date
        self.value = value
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        description <- map["desc"]
        date <- map["date"]
        value <- map["value"]
    }
}
