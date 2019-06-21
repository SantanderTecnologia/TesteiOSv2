//
//  StatementList.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 14/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation
import ObjectMapper

class StatementList: Mappable {
    var statementList: [Statement]?
    var error: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        statementList <- map["statementList"]
        error <- map["error"]
    }
}
