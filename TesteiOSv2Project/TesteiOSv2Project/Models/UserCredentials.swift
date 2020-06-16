//
//  User.swift
//  TesteiOSv2Project
//
//  Created by Andrey on 11/06/20.
//  Copyright © 2020 Andrey Matos. All rights reserved.
//

import Foundation

struct UserCredentials: Codable{
    var emailOrCPF: String
    var password: String
    
    enum CodingKeys: String, CodingKey{
        case emailOrCPF = "username"
        case password = "password"
    }
}
