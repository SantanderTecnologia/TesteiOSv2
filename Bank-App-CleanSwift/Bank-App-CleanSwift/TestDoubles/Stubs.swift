//
//  RequestModelStub.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 16/03/21.
//

import Foundation

/// Stubs for testing purposes
struct Stubs {
    static let REQUEST_MODEL_STUB = Login.Login.Request(fields: Login.LoginFields(username: "john.appleseed@accenture.com",
                                                                                  password: "Test@1"))
    static let VALID_USER = User(username: "john.appleseed@accenture.com", password: "Test@1")
    static let WRONG_PARAMETERS = UserWrongParameters(uzer: "mustafa.bin.laden@kaboom.com",
                                                      pazzvord: "Bo000m!!!")
}
