//
//  CDLStatementsModel.swift
//  Bank app
//
//  Created by mmalaqui on 20/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

class CDLStatementsModel : CommonDataLayerBaseModel, Codable{
    var id : String?
    var statementList : [CDLStatementModel]?
    
    override init() {
        //TODO
    }
    //enum to match model properties and JSON names
    enum CodingKeys: String, CodingKey {
        case statementList = "statementList"
    }
    
}


class CDLStatementModel : CommonDataLayerBaseModel, Codable{
    var title : String?
    var desc : String?
    var date : String?
    var value : Float?
    
    override init() {
        //TODO
    }
    
    //enum to match model properties and JSON names
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case desc = "desc"
        case date = "date"
        case value = "value"
    }
}
