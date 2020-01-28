//
//  LoginInteractor.swift
//  TesteiOSv2_ArlenPereira
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright (c) 2020 Arlen Ricardo Pereira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic
{
  func doSomething(request: Login.Something.Request)
}

protocol LoginDataStore
{
  //var name: String { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
  var presenter: LoginPresentationLogic?
  var worker: LoginWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Login.Something.Request)
  {
    worker = LoginWorker()
    worker?.doSomeWork()
    
    let response = Login.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
