//
//  LoginModels.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 15/02/19.
//  Copyright (c) 2019 Gilson Gil. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Login {
  struct SubmitFields {
    let user: String?
    let password: String?
  }

  enum SubmitLogin {
    struct Request {
      let fields: SubmitFields
    }

    struct Response {
      let error: LoginError?

      init(error: LoginError? = nil) {
        self.error = error
      }
    }

    struct ViewModel {
      let errorMessage: String?
      var activateUserTextField = false
      var activatePasswordTextField = false

      init(error: LoginError?) {
        errorMessage = error?.localizedDescription
        switch error {
        case .some(.emptyUser), .some(.invalidUser):
          activateUserTextField = true
        case .some(.emptyPassword), .some(.invalidPassword):
          activatePasswordTextField = true
        default:
          break
        }
      }
    }
  }
}

//enum CreateOrder
//{
//  struct Request
//  {
//    var orderFormFields: OrderFormFields
//  }
//  struct Response
//  {
//    var order: Order?
//  }
//  struct ViewModel
//  {
//    var order: Order?
//  }
//}
