//
//  AccountDetailWorker.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 26/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit
import PromiseKit

protocol AccountDetailNetworkLogic {
    func retrieveStatments(for id: Int) -> Promise<AccountDetail.Response>
}

class AccountDetailWorker: AccountDetailNetworkLogic {

    let network = NetworkProvider.shared
    
    func retrieveStatments(for id: Int) -> Promise<AccountDetail.Response> {
        network.request(.statements(id: id))
    }
}
