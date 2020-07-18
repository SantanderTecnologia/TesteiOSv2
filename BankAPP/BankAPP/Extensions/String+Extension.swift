//
//  String+Extension.swift
//  BankAPP
//
//  Created by Alexandre Carlos Aun on 29/06/20.
//  Copyright © 2020 Alexandre Carlos Aun. All rights reserved.
//

import Foundation

extension String {
    
    func applyFormatNumbersCPF(pattern: String, replacmentCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: self)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
    
    var isString: Bool {
           get {
               return Int(self) == nil
           }
       }
}
