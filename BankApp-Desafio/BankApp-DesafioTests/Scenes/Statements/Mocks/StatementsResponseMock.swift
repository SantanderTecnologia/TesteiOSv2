//
//  StatementsResponseMock.swift
//  BankApp-DesafioTests
//
//  Created by Mizia Lima on 2/28/21.
//

import Foundation
@testable import BankApp_Desafio

class StatementsResponseMock {
    
    static func fetchStatements() -> Statements.Response {
        let statement = StatementList(title: "Pagamento",
                                      desc: "Conta de luz - ENEL" ,
                                      date: "12/12/2020",
                                      value: 345.78)
        let error = StatementError()
        let statements = StatementAPIModel(statementList: [statement], error: error)
        return Statements.Response(statement: statements)
    }
}
