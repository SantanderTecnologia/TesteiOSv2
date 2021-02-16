//
//  StringExtensions.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

extension String {
    func at(_ i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    var onlyNumbers: String {
        guard !self.isEmpty else { return "" }
        return self.replacingOccurrences(of: "\\D", with: "", options: .regularExpression, range: self.startIndex..<self.endIndex)
    }
}
