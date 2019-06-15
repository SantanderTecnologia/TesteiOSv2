//
//  UserLoginGateway.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

protocol UserLoginGateway{
    func authLogin(user: String, password: String, completion: @escaping (UserAccount) -> ())
}
