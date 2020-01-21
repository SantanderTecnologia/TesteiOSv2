//
//  BankAppAPIProtocols.swift
//  BankApp
//
//  Created by Joni Campos on 26/09/19.
//  Copyright © 2019 Joni Campos. All rights reserved.
//

import Foundation


//implementa o protocolo do Login
protocol LoginProtocol {
    func login(_ login: String, password: String, completionHandler: @escaping (Login.Something.User?) -> Void)
}

