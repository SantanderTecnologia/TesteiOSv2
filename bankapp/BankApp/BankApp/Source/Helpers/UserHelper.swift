//
//  UserHelper.swift
//  BankApp
//
//  Created by Pedro Danilo Ferreira Veloso on 21/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

class UserHelper {
    static let shared = UserHelper()
    private(set) var current: LoginModel?
    
    private init() {}
    
    func initializeUser(login: LoginModel) {
        current = login
    }
    
    func clear() {
        current = nil
    }
}
