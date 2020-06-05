//
//  LoginPresenter.swift
//  TesteiOSV2
//
//  Created by Julio Cezar de Souza on 30/05/20.
//  Copyright (c) 2020 Julio Souza. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginPresentationLogic {
    func presentUserLogin(response: Login.Response)
    func presentDefaultError()
}

class LoginPresenter: LoginPresentationLogic {
    
  weak var viewController: LoginDisplayLogic?
    
    func presentUserLogin(response: Login.Response) {
        
        if response.userAccount.userId != nil {
            viewController?.displayLogin(response: response.userAccount)
        } else {
            viewController?.displayError(response: response.error)
        }
//        if let userAccount = response?.userAccount {
//
//        }
//
//        if let error = response?.error {
//
//        }
    }
    
    func presentDefaultError() {
        //
    }



}
