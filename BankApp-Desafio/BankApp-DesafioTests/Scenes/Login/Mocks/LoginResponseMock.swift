//
//  File.swift
//  BankApp-DesafioTests
//
//  Created by Mizia Lima on 2/28/21.
//

import Foundation
@testable import BankApp_Desafio

class LoginResponseMock {
    static func createResponse() -> Login.Response {
        let account = UserAccount(userID: 1,
                                  name: "Mizia Lima",
                                  bankAccount: "1234",
                                  agency: "567",
                                  balance: 1000.76)
        let error = UserError()
        let user = UserAPIModel(userAccount: account, error: error)
        
        return Login.Response(user: user)
    }
}
