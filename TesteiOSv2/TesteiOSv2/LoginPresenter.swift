//
//  LoginPresenter.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit

class LoginPresenter : LogicPresenterLogic{
    
    weak var viewController : LoginViewControllerProceed?
    
    /**
    Call viewController fuction to show account viewController.
     */
    func presentLoginResults() {
        viewController?.goToNextViewController()
    }
    /**
     Set UIAlertController according valided error to viewControlller.
     
     - parameters:
     - loginErrorEnum: LoginValidationErrorEnums
     */
    func presentLoginError(with loginErrorEnum: LoginValidationErrorEnum) {
        let errortitle = loginErrorEnum.errorTitle
        let errorMensage = loginErrorEnum.errorMensage
        
        let alertController = UIAlertController(title: errortitle, message: errorMensage, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController?.callALertController(alert: alertController)
        
    }
    
}
