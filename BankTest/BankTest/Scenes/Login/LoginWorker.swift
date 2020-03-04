//
//  LoginWorker.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 02/03/20.
//  Copyright (c) 2020 bank. All rights reserved.

import UIKit
import Moya

protocol LoginWorkerLogic {

    func performLogin(request: Login.Request,
                      success: @escaping ((_ response: Login.Response) -> Void),
                      failure: @escaping ((_ error: MoyaError) -> Void))
}

class LoginWorker {

    func performLogin(request: Login.Request,
                      success: @escaping ((_ response: Login.Response) -> Void),
                      failure: @escaping ((_ error: MoyaError) -> Void)) {
        let provider = MoyaProvider<LoginTarget>()
        provider.request(.perform(request)) { (result) in
            switch result {
                case .success(let item):
                    guard let parsed = item.data.parse(to: Login.Response.self) else {
                        return
                    }
                    success(parsed)
                case .failure(let error):
                    failure(error)
            }
        }
    }
}
