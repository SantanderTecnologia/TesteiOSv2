//
//  APIModel.swift
//  TesteiOSv2_ArlenPereira
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright © 2020 Arlen Ricardo Pereira. All rights reserved.
//

import Foundation
import SwiftyJSON

class LoginAPIModel: NSObject {
    var data: [LoginAPIRequest]?
    var message: String?
    var code: String?
    
    init(data: [LoginAPIRequest]?, message: String?, code: String?) {
        self.data = data
        self.message = message
        self.code = code
    }
}

class LoginAPIRequest: NSObject {
    var userId: Int?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: Double?
    var code: Int?
    var message: String?
    
    init(json: JSON) {
        userId = json["userAccount"]["userId"].intValue
        name = json["userAccount"]["name"].stringValue
        bankAccount = json["userAccount"]["bankAccount"].stringValue
        agency = json["userAccount"]["agency"].stringValue
        balance = json["userAccount"]["balance"].doubleValue
        code = json["error"]["code"].intValue
        message = json["error"]["message"].stringValue
    }
}

class StatementsAPIModel: NSObject {
    var data: StatementsAPIRequest?
    var message: String?
    var code: String?
    
    init(data: StatementsAPIRequest?, message: String?, code: String?) {
        self.data = data
        self.message = message
        self.code = code
    }
}

class StatementsAPIRequest: NSObject {
    var statementList: [JSON]?
    
    init(statements: [JSON]?) {
        self.statementList = statements
    }
}
