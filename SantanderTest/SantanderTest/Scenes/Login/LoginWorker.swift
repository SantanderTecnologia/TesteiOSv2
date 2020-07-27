//
//  LoginWorker.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit
import PromiseKit

protocol LoginNetworkLogic {
    func performLogin(with request: Login.Request) -> Promise<Login.Response>
}

class LoginWorker: LoginNetworkLogic {
    
    let network = NetworkProvider.shared
    
    func performLogin(with request: Login.Request) -> Promise<Login.Response> {
        network.request(.login(user: request.user, password: request.password))
    }
}
