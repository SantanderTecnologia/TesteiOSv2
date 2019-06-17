//
//  LoginPresenter.swift
//  TesteSantander
//
//  Created by Hugo Abolis Jordao on 13/06/19.
//  Copyright (c) 2019 Hugo Abolis Jordao. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginPresentationLogic
{
  func presentSomething(response: Login.Fetch.Response?)
}

class LoginPresenter: LoginPresentationLogic
{
  weak var viewController: LoginDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Login.Fetch.Response?)
  {
    var viewModel = Login.Fetch.ViewModel(userAccount: nil, errorMessage: nil)
    
    if response == nil || response?.error?.message != nil{
        viewModel.errorMessage = response?.error?.message ?? "Ocorreu um erro, por favor tente novamente"
        viewController?.displayError(viewModel: viewModel)
    }else{
        viewModel.userAccount = response!.userAccount
        viewController?.displaySuccess(viewModel: viewModel)
    }
  }
}
