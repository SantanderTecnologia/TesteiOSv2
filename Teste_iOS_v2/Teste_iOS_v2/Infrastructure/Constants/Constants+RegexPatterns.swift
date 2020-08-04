//
//  Constants+RegexPatterns.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 01/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation

extension Constants.RegexPatterns {
    static let specialCharacters = "[!@#$%~ˆ&*_+-]"
    static let capitalLetters = "[A-Z]"
    static let numbers = "[0-9]"
    static let email = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
}
