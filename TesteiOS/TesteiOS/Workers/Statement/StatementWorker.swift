//
//  StatementWorker.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 15/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation

class StatementWorker {
    func getStatments(request: Statements.get.Request, callback: @escaping (_ request: Statements.get.Response?) -> Void) {
        
        RestApi.getStatement(id: String(request.userAccount?.userId ?? 0), callback: {
            response in
            let response = Statements.get.Response(userAccount: request.userAccount, statements: response?.statementList)
            callback(response)
        }, error: {
            
        })
    }
}
