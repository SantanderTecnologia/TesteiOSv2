//
//  LoginTarget.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 02/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import Foundation
import Moya

enum LoginTarget: BaseTarget {

    case perform(Login.Request)
}

extension LoginTarget {

    var path: String {
        return "login"
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        switch self {
        case .perform(let login):
            guard let user = login.user, let password = login.password else {
                return .requestPlain
            }
            return .requestParameters(parameters: ["user": user, "password": password], encoding: URLEncoding.default)
        }
    }
}
