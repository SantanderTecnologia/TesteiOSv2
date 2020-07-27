//
//  Constants.swift
//  TesteIOS
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

import Foundation

struct Constants {
    static let login = "https://bank-app-test.herokuapp.com/api/login"
    static let statements = "https://bank-app-test.herokuapp.com/api/statements/1"
    static let emailRegex = "[a-zA-Z0-9][a-zA-Z0-9._-]{1,64}+@[a-zA-Z0-9-]{1,63}+\\.[a-zA-Z]{2,63}(?:\\.[a-zA-Z]{2,63})?"
    static let capitalLetterRegex = ".*[A-Z]+.*"
    static let numberRegex = ".*[0-9]+.*"
    static let specialCharacterRegex = ".*[!&^%$#@()/]+.*"
    static let statementSegue = "ShowStatement"
    static let statementCell = "statementCell"
    static let lastUsername = "lastUsername"
}
