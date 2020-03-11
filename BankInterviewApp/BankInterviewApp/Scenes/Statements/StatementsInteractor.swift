//
//  StatementsInteractor.swift
//  BankInterviewApp
//
//  Created by Osias Carneiro on 10/03/20.
//  Copyright (c) 2020 Osias Carneiro. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StatementsBusinessLogic
{
  func fetchStatements(request: Statements.StatementList.Request)
  func doLogout()
}

protocol StatementsDataStore
{
    var userData: Statements.UserData.ViewModel? { get set }
}

class StatementsInteractor: StatementsBusinessLogic, StatementsDataStore
{
  var presenter: StatementsPresentationLogic?
  var worker: StatementsWorker?
  var statementsWorker: FetchStatementsWorker = FetchStatementsWorker(store: StatementAPI())
    var localUserStore: LocalUserStore = KeychainUserStore()
  var userData: Statements.UserData.ViewModel?
  
    let dateFormatterFrom: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    let dateFormatterTo: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
  // MARK: Fetch statements
  
  func fetchStatements(request: Statements.StatementList.Request)
  {
    statementsWorker.fetchStatements(userId: request.userId, completionHandler: { [weak self] response in
        if !response.statementList.isEmpty {
            var model = Statements.StatementList.ViewModel(statements: [])
            let transformed = response.statementList.map({ (item) -> Statements.StatementList.Statement in
                var dateFormatted = ""
                if let date = self?.dateFormatterFrom.date(from: item.date) {
                    dateFormatted = self?.dateFormatterTo.string(from: date) ?? ""
                }
                
                return Statements.StatementList.Statement(transaction: item.title, description: item.desc, date: dateFormatted, value: item.value.formatToCoin())
            })
            model.statements.append(contentsOf: transformed)
            self?.presenter?.presentFetchedStatements(response: model)
        }
    })
  }
    
    func doLogout()
    {
        localUserStore.storeUser(user: "")
    }
}
