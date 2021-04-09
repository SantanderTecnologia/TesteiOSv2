//
//  classLoginViewModel.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 01/04/21.
//

import Foundation
import WorkersLibrary
import ServicesLibrary
import RxSwift
import RxCocoa

public
class LoginViewModel
{
      public let loginCredentials = LoginCredentials()
            
      public let emailOrCPFModel = EmailOrCPFModel()
      public var passwordModel = PasswordModel()
      
      public let isLoading : BehaviorRelay<Bool> = BehaviorRelay(value: false)
      public let isSuccess : BehaviorRelay<Bool> = BehaviorRelay(value: false)
      public let errorMsg : BehaviorRelay<String> = BehaviorRelay(value: "")
      
      public let disposeBag = DisposeBag()
      
      public func validateEmailOrCPFCredentials() -> Bool
      {
            return emailOrCPFModel.validateData()
      }
      
      public func validatePasswordCredentials() -> Bool
      {
            return passwordModel.validateData()
      }
      
      public func loginCredentialsAction()
      {
            loginCredentials.emailOrCPF = emailOrCPFModel.data.value
            loginCredentials.password = passwordModel.data.value
            
            self.isLoading.accept( true )
            
            LoginProxy.loginRxUserAction( loginCredentials.emailOrCPF, loginCredentials.password )
                  .bind { [self] userLogin in
                        print("LoginProxy userLogin ---> \(userLogin)")

                        userWSLogin = userLogin
                        userEmailOrCPF = loginCredentials.emailOrCPF
                        defaults.set(userEmailOrCPF, forKey: "userEmailOrCPF")

                        passwordModel.data.accept( "" )

                        self.isLoading.accept( false )
                        self.isSuccess.accept( true )
                        self.errorMsg.accept( "" )
                  }
                  .disposed(by: disposeBag)

      }
}
