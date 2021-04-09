//
//  extensionLoginViewController.swift
//  LoginLibrary
//
//  Created by LeandroLee on 08/04/21.
//

import Foundation
import WorkersLibrary
import BankStatementLibrary

extension LoginViewController
{
      
      public func bankStatementAction()
      {
            let storyboardBundle = Bundle(for: BankStatementLibrary.BankStatementViewController.self)
            let storyboard = UIStoryboard(name: "BankStatementStoryboard", bundle: storyboardBundle)
            let bankStatementVC = storyboard.instantiateViewController(withIdentifier : "BankStatementViewController")
            bankStatementVC.modalPresentationStyle = .fullScreen

            self.show(bankStatementVC, sender: self)
      }

      public func loginRxUserAction()
      {
            if loginViewModel.validateEmailOrCPFCredentials()
            {
                  if loginViewModel.validatePasswordCredentials()
                  {
                        loginViewModel.loginCredentialsAction()
                  }
                  else
                  {
                        let loginError = LoginError.PasswordFail.rawValue
                        self.showErrorAlert( loginError )
                  }
            }
            else
            {
                  let loginError = LoginError.EmailOrCPFFail.rawValue
                  self.showErrorAlert( loginError )
            }
      }
}
