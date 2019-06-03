//
//  Seeds.swift
//  TesteSantanderTests
//
//  Created by Felipe Alexander Silva Melo on 03/06/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation

@testable import TesteSantander

fileprivate let emptyError = APIError(code: nil, message: nil)

struct Seeds {
    
    struct Users {
        static let joao = User(
            userAccount: UserAccount(userId: 9999, name: "João", bankAccount: "1239", agency: "3333", balance: 9999.99),
            error: APIError(code: nil, message: nil)
        )
        static let maria = User(
            userAccount: UserAccount(userId: 8888, name: "Maria", bankAccount: "9871", agency: "7777", balance: 8888.88),
            error: emptyError
        )
        static let error = User(
            userAccount: UserAccount(userId: nil, name: nil, bankAccount: nil, agency: nil, balance: nil),
            error: APIError(code: TestConstants.loginErrorCode, message: TestConstants.loginErrorMessage)
        )
    }
    
    struct Forms {
        static let validUserWithCPF = Login.UserFormFields(user: "02053516119", password: "Test@1")
        static let validUserWithEmail = Login.UserFormFields(user: "felipe.silva.melo@everis.com", password: "Test@1")
        
        static let invalidUserCPF1 = Login.UserFormFields(user: "0205351611", password: "Test@1")
        static let invalidUserCPF2 = Login.UserFormFields(user: "020535161199", password: "Test@1")
        
        static let invalidUserEmail1 = Login.UserFormFields(user: "felipe.silva.melo@everis", password: "Test@1")
        static let invalidUserEmail2 = Login.UserFormFields(user: "felipe.silva.melo.everis.com", password: "Test@1")
        
        static let invalidUserPassword1 = Login.UserFormFields(user: "felipe.silva.melo@everis.com", password: "Test1")
        static let invalidUserPassword2 = Login.UserFormFields(user: "felipe.silva.melo@everis.com", password: "Test@")
        static let invalidUserPassword3 = Login.UserFormFields(user: "felipe.silva.melo@everis.com", password: "test@1")
    }
    
    struct Statements {
        static let emptyStatements = UserStatements(
            statementList: [],
            error: emptyError
        )
        
        static let statements = UserStatements(
            statementList: [
                Statement(title: "Pagamento", desc: "Conta de luz", date: "2018-08-15", value: -50),
                Statement(title: "TED Recebida", desc: "Joao Alfredo", date: "2018-07-25", value: 745.03),
                Statement(title: "DOC Recebida", desc: "Victor Silva", date: "2018-06-23", value: 399.9)
            ],
            error: emptyError
        )
        
        static let error = UserStatements(
            statementList: [],
            error: APIError(code: 53, message: TestConstants.statementsErrorMessage)
        )
    }
    
}
