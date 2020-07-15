//
//  AccountDetailsInteractor.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

protocol AccountDetailsBusinessLogic {
    func fetchStatements()
    func fetchAccountInfo()
}

protocol AccountDetailsDataStore {
    var userAccount: AccountInfo? { get set }
    var statements: [Statement]? { get set }
}

class AccountDetailsInteractor: AccountDetailsBusinessLogic, AccountDetailsDataStore {
    
    var statements: [Statement]?
    var userAccount: AccountInfo?
    
    var presenter: AccountDetailsPresentationLogic?
    var worker: AccountDetailsWorker?
    
    func fetchAccountInfo() {
        guard let accountInfo = userAccount else {
            presenter?.logoutUser()
            return
        }
        
        let response = AccountDetails.FetchAccountInfo.Response(accountInfo: accountInfo)
        self.presenter?.presentFetchedAccountInfo(response: response)
    }
    
    func fetchStatements() {
        
        guard let userId = userAccount?.userId else {
            // no user ID was found
            presenter?.logoutUser()
            return
        }
        
        worker = AccountDetailsWorker()
        let request = AccountDetails.FetchStatements.Request(userId: "\(userId)")
        
        worker?.fetchStatements(request: request, completion: { (response) in
            switch response {
            case .success(let statements):
                self.statements = statements
                let response = AccountDetails.FetchStatements.Response(statementList: statements)
                self.presenter?.presentFetchedStatements(response: response)
                break
            case .error(let error):
                // TODO: present empty list with button to reload
                print("Error \(error.localizedDescription)")
                break
            case .nonSpecifiedError:
                // TODO: present empty list with button to reload
                print("Error")
                break
            }
        })
    }
    
}
