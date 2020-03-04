//
//  AccountWorker.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright (c) 2020 bank. All rights reserved.

import UIKit
import Moya

protocol AccountWorkerLogic {

    func statements(success: @escaping ((_ response: Account.Response) -> Void),
                    failure: @escaping ((_ error: MoyaError) -> Void))
}

class AccountWorker: AccountWorkerLogic {

    func statements(success: @escaping ((_ response: Account.Response) -> Void),
                    failure: @escaping ((_ error: MoyaError) -> Void)) {
        let provider = MoyaProvider<AccountTarget>()
        provider.request(.statements) { (result) in
            switch result {
                case .success(let item):
                    guard let parsed = item.data.parse(to: Account.Response.self) else {
                        return
                    }
                    success(parsed)
                case .failure(let error):
                    failure(error)
            }
        }
    }
}
