//
//  StatementAPIMock.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import Foundation

class StatementAPIMock: StatementStoreProtocol {
    
    var response: StatementResponse = {
       var statementList: [Statement] = []
        for i in 0...9 {
            statementList.append(Statement(title: "TED \(i)", desc: "Pagamento \(i)", date: "2019-6-12", value: Float(i)))
        }
        return StatementResponse(statementList: statementList, error: Error())
    }()
    let rightId = 1
    
    func fetchStatements(_ userId: Int, completionHandler: @escaping (StatementResponse) -> ()) {
        if(userId == rightId) {
            completionHandler(response)
        } else {
            response.statementList = []
            response.error = Error(code: 500, message: "User not exists")
            completionHandler(response)
        }
    }
    
}
