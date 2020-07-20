//
//  Collection+Extensions.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 14/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

extension Collection where Element == Int {
    
    /// To validate the 1st CPF digit:
    /// To get the CPF digit, we need to multiply each digit (from 1º to 9º) starting by 10 and subctracting by 1 each iteration. After that, we subtract from 11 the rest of the sum of all multiplications divided by 11. If the result is greater than 9, then the verification digit is 0, otherwise its the result.
    /// To validate the 2nd CPF digit we repeat the process, but using digits from 1º to 10º and the multiplications starts by 11.
    var cpfDigit: Int {
        var number = count + 2
        let digit = 11 - reduce(into: 0) {
            number -= 1
            $0 += $1 * number
        } % 11
        return digit > 9 ? 0 : digit
    }
}
