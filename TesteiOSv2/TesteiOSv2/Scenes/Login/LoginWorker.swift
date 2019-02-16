//
//  LoginWorker.swift
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

import KeychainSwift

final class LoginWorker {
  func validateUser(fields: Login.SubmitFields) throws {
    guard let user = fields.user, !user.isEmpty else { throw LoginError.emptyUser }
    guard let password = fields.password, !password.isEmpty else { throw LoginError.emptyPassword }

    guard EmailValidation.validate(value: user) || CPFValidation.validate(value: user) else {
      throw LoginError.invalidUser
    }

    guard PasswordValidation.validate(value: password) else { throw LoginError.invalidPassword }
  }

  func submitLogin(request: Login.SubmitLogin.Request, completion: @escaping (Login.SubmitLogin.Response) -> Void) {
    API.login(request: request) { [weak self] response in
      if response.userAccount != nil {
        self?.persistCredentials(fields: request.fields)
      }
      completion(response)
    }
  }

  func persistCredentials(fields: Login.SubmitFields) {
    guard let data = try? JSONEncoder().encode(fields) else { return }
    KeychainSwift().set(data, forKey: "bank")
  }

  func getPersistedCredentials() -> Login.SubmitFields? {
    guard let data = KeychainSwift().getData("bank") else { return nil }
    guard let fields = try? JSONDecoder().decode(Login.SubmitFields.self, from: data) else { return nil }
    return fields
  }
}
