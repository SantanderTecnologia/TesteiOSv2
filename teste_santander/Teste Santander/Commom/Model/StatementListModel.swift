//
//  StatementListModel.swift
//  Teste Santander
//
//  Created by THIAGO on 09/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import ObjectMapper

class StatementListModel: Mappable {
    var statementList: [StatementModel] = []
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        statementList <- map["statementList"]
    }
}
