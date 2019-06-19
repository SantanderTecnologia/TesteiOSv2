//
//  LoginModels.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 12/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation
import Alamofire

enum Login {
    struct Auth {
        var user: String
        var password: String
        
        func getParameters() -> Parameters {
            return ["user": user, "password": password]
        }
    }
    struct Request {
        var auth: Auth
    }
    struct Response: Decodable {
        var userAccount: UserAccount?
    }
    struct ViewModel {
        var auth: Auth
    }
}
