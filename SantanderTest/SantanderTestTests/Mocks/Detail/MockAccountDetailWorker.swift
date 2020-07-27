//
//  MockAccountDetailWorker.swift
//  SantanderTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 27/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
import PromiseKit
@testable import SantanderTest


enum AccountDetailReturnTypes {
    case failure
    case success(id: Int)
}

class MockAccountDetailWorker: AccountDetailNetworkLogic {
    
    var returnType: AccountDetailReturnTypes = .success(id: 1)
    
    func retrieveStatments(for id: Int) -> Promise<AccountDetail.Response> {
        switch returnType {
        case .failure:
            return Promise { seal in seal.reject(NetworkError.emptyData)}
        case .success(let id):
            let reader = JSONFileReader()
            if let response: AccountDetail.Response = reader.read(filename: "statements-\(id)") {
                return Promise { seal in seal.fulfill(response)}
            } else {
                return Promise { seal in seal.reject(NetworkError.parserError)}
            }
        }
    }
}
