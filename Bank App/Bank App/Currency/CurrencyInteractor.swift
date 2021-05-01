//
//  CurrencyInteractor.swift
//  Bank App
//
//  Created by Christian Castro on 29/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CurrencyBusinessLogic
{
  func doSomething(request: Currency.Something.Request)
}

protocol CurrencyDataStore
{
  //var name: String { get set }
}

class CurrencyInteractor: CurrencyBusinessLogic, CurrencyDataStore
{
  var presenter: CurrencyPresentationLogic?
  var worker: CurrencyWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Currency.Something.Request)
  {
    worker = CurrencyWorker()
    worker?.doSomeWork()
    
    let response = Currency.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
