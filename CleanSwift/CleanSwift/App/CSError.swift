//
//  CSError.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

enum CSError: Error {
    case mandatoryUser
    case mandatoryPassword
    case invalidUser
    case invalidPassword
}

extension CSError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .mandatoryUser: return Constants.Error.mandatoryUser
        case .invalidUser: return Constants.Error.invalidUser
        case .mandatoryPassword: return Constants.Error.mandatoryPassword
        case .invalidPassword: return Constants.Error.invalidPassword
        }
    }
}
