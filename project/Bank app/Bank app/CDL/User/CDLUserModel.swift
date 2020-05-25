//
//  CDLUserModel.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

class CDLUserModel : CommonDataLayerBaseModel, Codable{
    var id : Int?
    var name : String?
    var accountNumber : String?
    var agencyID : String?
    var balance : Float?
    
    override init() {
        //TODO
    }
    //enum to match model properties and JSON names
    enum CodingKeys: String, CodingKey {
        case id = "userId"
        case name = "name"
        case accountNumber = "bankAccount"
        case agencyID = "agency"
        case balance = "balance"
    }
    
    

    
}

class CDLUserErrorModel: CommonDataLayerBaseModel, Codable {
    var message : String?
    var errorCode : Int?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case errorCode = "code"
    }
}



class CDLUserResponseModel: CommonDataLayerBaseModel, Codable {
    var userAccount : CDLUserModel?
    var error: CDLUserErrorModel?
    
    enum CodingKeys: String, CodingKey {
        case userAccount = "userAccount"
        case error = "error"
    }
}
