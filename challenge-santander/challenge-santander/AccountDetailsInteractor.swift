//
//  AccountDetailsInteractor.swift
//  challenge-santander
//
//  Created by Hugo Ferreira on 17/05/20.
//  Copyright (c) 2020 Hugo Ferreira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AccountDetailsBusinessLogic
{
  func doSomething(request: AccountDetails.Something.Request)
}

protocol AccountDetailsDataStore
{
  //var name: String { get set }
}

class AccountDetailsInteractor: AccountDetailsBusinessLogic, AccountDetailsDataStore
{
  var presenter: AccountDetailsPresentationLogic?
  var worker: AccountDetailsWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: AccountDetails.Something.Request)
  {
    worker = AccountDetailsWorker()
    worker?.doSomeWork()
    
    let response = AccountDetails.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
