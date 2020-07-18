//
//  ValidateEmail.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 29/06/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import Foundation

public struct ValidateEmail {
    public static func validate(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
}
