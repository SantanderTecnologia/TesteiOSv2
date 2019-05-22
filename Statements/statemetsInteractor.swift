//
//  StatementsInteractor.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 05/04/19.
//  Copyright (c) 2019 Lucas Brandão Pereira. All rights reserved.


import UIKit

protocol StatementsBusinessLogic {
    func fetchStatements(request: Statements.FetchStatements.Request)
    func passUserInfo(request: Statements.PreviousScreen.Request)
}

protocol StatementsDataStore {
    var userInfo: UserInfo? { get set }
    var statements: [StatementsData] { get set }
}

class StatementsInteractor: StatementsBusinessLogic, StatementsDataStore {

    var userInfo: UserInfo?
    var statements: [StatementsData] = []
    
    var presenter: StatementsPresentationLogic?
    var worker: StatementsWorker?
    
    var dataSource: StatementsDataSource?
    
    private var statementsDataSource : StatementsDataSource?
    //PASSAR VIA DATASOURCE
    init(){
        statementsDataSource = StatementsDataSource(statements: [])
    }
    
    // MARK: Do something

    
    func passUserInfo(request: Statements.PreviousScreen.Request){
        let response = Statements.PreviousScreen.Response(userInfo: userInfo!)
        presenter!.presentUserInfo(response: response)
    }
    
    
    func fetchStatements(request: Statements.FetchStatements.Request) {
        worker = StatementsWorker()
        worker?.doSomeWork()
        worker!.fetch(){ (response, errorMessage) in

            for item in response!.statementList{
                
                self.statements.append(StatementsData(title: item.title, desc: item.desc, date: item.date, value: Double(item.value).currency() ?? "n/a"))
                
            }


            let numberOfItems = self.statements.count
            self.dataSource = StatementsDataSource(statements: self.statements)
            let responseStatements = Statements.FetchStatements.Response(statementsData: self.dataSource, numberOfItems: numberOfItems)
            self.presenter?.presentStatements(response: responseStatements)
        }

       
    }
}
