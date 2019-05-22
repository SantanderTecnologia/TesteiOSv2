//
//  LoginResponse.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 07/04/19.
//  Copyright © 2019 Lucas Brandão Pereira. All rights reserved.
//

import Foundation

struct LoginResponse : Decodable{
    
    var userAccount : UserAccount
    
    struct  UserAccount : Decodable {
        var userId : Int
        var name : String
        var bankAccount : String
        var agency : String
        var balance : Double
    }
    
    var error : Error
    
    struct Error : Decodable{}
}

