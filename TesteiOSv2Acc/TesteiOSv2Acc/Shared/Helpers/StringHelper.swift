//
//  StringHelper.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 28/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

import Foundation

class StringHelper {
    
    private init(){}
    
    static func formatBankAccount(bankAccount: String) -> String
    {
        var result = ""
        
        if bankAccount.count > 3{
            var characteres = Array(bankAccount)
            characteres.insert(".", at: 2)
            characteres.insert("-", at: characteres.count - 1)
            result = String(characteres)
        }
        
        return result
    }
    
}
