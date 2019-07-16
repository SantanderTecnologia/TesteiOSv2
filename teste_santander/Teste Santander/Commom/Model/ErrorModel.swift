//
//  ErrorModel.swift
//  Teste Santander
//
//  Created by THIAGO on 10/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import ObjectMapper

class ErrorModel: Mappable {
    var code: Int = 0
    var message: String = "Error default do sistema"
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        code <- map["error.code"]
        message <- map["error.message"]
    }
}
