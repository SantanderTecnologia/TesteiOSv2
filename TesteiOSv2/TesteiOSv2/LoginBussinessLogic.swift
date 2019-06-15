//
//  LoginBussinessLogic.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation


protocol LoginBussinessLogic{
    func validLogin(user: String, password: String) -> LoginValidationErrorEnum
    func login(user: String, password: String)
}
