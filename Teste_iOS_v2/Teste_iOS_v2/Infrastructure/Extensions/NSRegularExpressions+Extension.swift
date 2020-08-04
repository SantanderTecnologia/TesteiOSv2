//
//  NSRegularExpressions+Extension.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 01/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation

extension NSRegularExpression {
    convenience init(_ regexPattern: String) {
        do {
            try self.init(pattern: regexPattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(regexPattern).")
        }
    }
    
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}
