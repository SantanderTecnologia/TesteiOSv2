//
//  ValidatorPassword.swift
//  Validator
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Presenter

public class PasswordValidate: UserNameValidateProtocol {
     
    public init() { }
    
    public func isValid(userName: String?) -> Bool {
        guard let text = userName else { return false }
        
        let capitalPattern = "[A-Z]+"
        let rangeCapital = NSRange(location: 0, length: text.utf16.count)
        let regexCapital = try! NSRegularExpression(pattern: capitalPattern)
        let capitalResult = regexCapital.firstMatch(in: text, options: [], range: rangeCapital) != nil
        
        let numberPattern = "[0-9]+"
        let rangeNumber = NSRange(location: 0, length: text.utf16.count)
        let regexNumber = try! NSRegularExpression(pattern: numberPattern)
        let numberResult = regexNumber.firstMatch(in: text, options: [], range: rangeNumber) != nil
        
        
        let specialCharacterPattern = "[.*&^%$#@()/]+"
        let rangeSpecialCharacter = NSRange(location: 0, length: text.utf16.count)
        let regexSpecialCharacter = try! NSRegularExpression(pattern: specialCharacterPattern)
        let specialCharacterResult = regexSpecialCharacter.firstMatch(in: text, options: [], range: rangeSpecialCharacter) != nil
        
        return capitalResult && numberResult && specialCharacterResult
    }
}
