//
//  LoginInteractorModel.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

//class that represents the interactor data
class LoginInteractorModel {
    var id : Int?
    var name : String?
    var accountNumber : String?
    var agencyID : String?
    var balance : Float?
    
    init(cdlUser: CDLUserModel) {
        self.id = cdlUser.id
        self.name = cdlUser.name
        self.accountNumber = cdlUser.accountNumber
        self.agencyID = cdlUser.agencyID
        self.balance = cdlUser.balance
    }
    
    init(loginDTO: LoginDTO?){
        if let loginDTO = loginDTO {
            //TODO convertion
        }
    }
}
