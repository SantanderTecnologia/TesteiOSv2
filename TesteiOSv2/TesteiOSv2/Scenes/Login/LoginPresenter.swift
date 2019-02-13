//
//  LoginPresenter.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright (c) 2019 Accenture. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

//MARK: - Protocols
protocol LoginPresentationLogic
{
    func presentStatement(response: Login.LoginModels.Response)
    func presentLoading()
    func removeLoading()
    func presentLoginErrorAlert(error:LoginError)
}

//MARK: - Class body
class LoginPresenter: LoginPresentationLogic
{
    
    //MARK: - Properties
    weak var viewController: LoginDisplayLogic?
    
    //MARK: - Functions
    func presentStatement(response: Login.LoginModels.Response)
    {
        let viewModel = Login.LoginModels.ViewModel(userModel: response.userModel)
        viewController?.displayStatement(viewModel: viewModel)
    }
    
    func presentLoginErrorAlert(error:LoginError) {
        viewController?.displayAlert(title: error.title, message: error.description, titleFirstButton: "Ok")
    }
    
    func presentLoading() {
        viewController?.displayLoading()
    }
    
    func removeLoading() {
        viewController?.removeLoading()
    }
    
}
