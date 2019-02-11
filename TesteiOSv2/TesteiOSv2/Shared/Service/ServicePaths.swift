//
//  ServicePaths.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 11/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

enum ServicePath:String {
    case BASE_URL = "https://bank-app-test.herokuapp.com/"
    case LOGIN_PATH = "/api/login"
    case STATEMENTS_PATH = "ap1/statements/1"
    
    var description: String {
        return self.rawValue
    }
}
