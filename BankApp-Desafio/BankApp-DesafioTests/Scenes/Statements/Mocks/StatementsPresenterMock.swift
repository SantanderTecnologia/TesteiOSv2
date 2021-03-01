//
//  StatementsPresenterMock.swift
//  BankApp-DesafioTests
//
//  Created by Mizia Lima on 2/28/21.
//

import Foundation
@testable import BankApp_Desafio

class StatementsPresenterMock: StatementsPresentationLogic {
    var receivedResponse: Statements.Response?
    var receivedMessage: String?
    var presentErrorMessageWasCalled = false

    func presentStatement(response: Statements.Response) {
        self.receivedResponse = response
    }
    
    func presentErrorMessage(message: String) {
        self.presentErrorMessageWasCalled = true
        self.receivedMessage = message
    }
}
