//
//  UserAccont.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

struct UserAccount : Decodable{
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Float
}
