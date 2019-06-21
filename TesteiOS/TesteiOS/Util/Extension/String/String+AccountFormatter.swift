//
//  String+AccountFormatter.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 14/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation

extension String {
    func bankAccountFormatter() -> String {
        var formattedAccount = self
        if formattedAccount.count > 3 {
            var characters = Array(self)
            characters.insert(".", at: 2)
            characters.insert("-", at: self.count)
            formattedAccount = String(characters)
        }
        return formattedAccount
    }
}
