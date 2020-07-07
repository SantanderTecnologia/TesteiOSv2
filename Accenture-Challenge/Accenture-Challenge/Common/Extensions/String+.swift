//
//  String+.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 05/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import Foundation

extension String {
    
    static var empty: String { return ""}
    
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    func hasUppercaseLetter() -> Bool {
        return contains(where: {
            $0 >= "A" && $0 <= "Z"
        })
    }
    
    func hasNumber() -> Bool {
        return contains(where: {
            $0 >= "0" && $0 <= "9"
        })
    }
    
    func hasSpecialCharacters() -> Bool {

        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.count)) {
                return true
            }

        } catch {
            debugPrint(error.localizedDescription)
            return false
        }

        return false
    }
}
