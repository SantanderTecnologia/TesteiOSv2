//
//  PaymentsWorkerMock.swift
//  Accenture-ChallengeTests
//
//  Created by Pedro Alvarez on 05/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

@testable import Accenture_Challenge

class PaymentsWorkerMock: PaymentsWorkerProtocol {
    
    func fetchStatements(_ request: Payments.Request.Statements, completion: @escaping StatementsCallback) {
        completion(.success([Payments.Response.Statements(title: "Title", desc: "Description", date: "06/02/2019", value: 10.0),
                             Payments.Response.Statements(title: "Title", desc: "Description", date: "15/04/2019", value: 10.0),
                             Payments.Response.Statements(title: "Title", desc: "Description", date: "11/05/2019", value: 10.0)]))
    }
}
