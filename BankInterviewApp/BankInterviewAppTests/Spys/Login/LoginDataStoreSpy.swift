//
//  LoginDataStoreSpy.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

class LoginDataStoreSpy: LoginDataStore {
    
    var nilResponse = false
    var response: Login.Response? {
        if(nilResponse) { return nil }
        else { return Login.Response(id: 1, name: "Joao dos testes", agency: "1000", account: "123456789", balance: 36.65) }
    }
    
}
