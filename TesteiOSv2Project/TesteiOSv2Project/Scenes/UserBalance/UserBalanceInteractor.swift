//
//  UserBalanceInteractor.swift
//  TesteiOSv2Project
//
//  Created by Andrey on 15/06/20.
//  Copyright (c) 2020 Andrey Matos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol UserBalanceBusinessLogic
{
    func fetchStatements()
    func displayUserInfo()
}

protocol UserBalanceDataStore
{
    //var name: String { get set }
    var userAccount: UserAccount? { get set }
}

class UserBalanceInteractor: UserBalanceBusinessLogic, UserBalanceDataStore
{
    var userAccount: UserAccount?
    
    var presenter: UserBalancePresentationLogic?
    var worker: UserBalanceWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func displayUserInfo(){
        if let userAccount = userAccount{
            presenter?.presentUserInfo(userAccount: userAccount)
        }
    }
    
    func fetchStatements()
    {
        worker = UserBalanceWorker(bankStore: BankAPI())
        if let userAccount = userAccount{
            worker?.fetchStatements(userAccount: userAccount, completionHandler: { response, error in
                DispatchQueue.main.async {
                    if let response = response{
                        self.presenter?.presentStatements(response: response)
                    }
                }
            })
        }
    }
}
