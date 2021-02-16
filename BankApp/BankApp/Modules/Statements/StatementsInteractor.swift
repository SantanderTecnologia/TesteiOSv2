//
//  StatementsInteractor.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class StatementsInteractor {
    
    var presenter: StatementsPresenterProtocol?
    var statementsList: [StatementStruct] = []
    
    var userInfo: StatementsModels.UserInfoResponse
    
    init(userInfo: StatementsModels.UserInfoResponse) {
        self.userInfo = userInfo
    }
    
    
    // MARK: - Methods
    
    func fetchStatement() {
        presenter?.startRequest()
        StatementRequester.getAll(userId: userInfo.info.userId) { response in
            self.presenter?.finishRequest()
            
            self.manageFetchResponse(response)
        } fail: { errorMessage in
            self.presenter?.finishRequest()
            self.presenter?.didFailToFetchStatement(errorMessage)
        }
    }
    
    func manageFetchResponse(_ response: StatementsResponseStruct) {
        // Se retornar objeto de erro, exibe mensagem de erro
        if let errorMessage = BadRequestStruct(badRequest: response.error) {
            self.presenter?.didFailToFetchStatement("\(errorMessage.message!) (\(errorMessage.code!))")
            return }
        
        // Ordenação por data
        self.statementsList = response.statementList.sorted(by: {
            $0.date > $1.date
        })
        
        let presenterResponse = StatementsModels.Response(statementsList: self.statementsList)
        self.presenter?.presentFetchedStatements(response: presenterResponse)
    }
    
}

// MARK: - Access from View

extension StatementsInteractor: StatementsInteractorProtocol {
    func viewDidLoad() {
        presenter?.presentUserInfo(userInfo)
        
        fetchStatement()
    }
    
    func tryFetchAgain() {
        fetchStatement()
    }
    
    func logout() {
        UserInfoLocalEntity.clear()
        
        presenter?.logout()
    }
}
