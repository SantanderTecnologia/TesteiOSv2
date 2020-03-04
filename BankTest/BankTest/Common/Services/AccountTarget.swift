//
//  AccountTarget.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import Foundation
import Moya

enum AccountTarget: BaseTarget {

    case statements
}

extension AccountTarget {

    var path: String {
        switch self {
        case .statements:
            return "statements/1"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }
}
