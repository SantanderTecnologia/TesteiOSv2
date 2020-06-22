//
//  LoginData.swift
//  Teste_BrunaDrago
//
//  Created by Bruna Fernanda Drago on 21/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import Foundation

class LoginData{
    var statusCode : Int
    var agency :String
    var balance : Double
    var account :String
    var name : String
    var userid : Int
    init(statusCode : Int, agency :String,balance : Double, account :String, name : String, userid : Int) {
        self.statusCode = statusCode
        self.agency = agency
        self.balance = balance
        self.account = account
        self.name = name
        self.userid = userid
    }
}
