//
//  CPFValidator.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

extension StringProtocol {
    /**
    Check a valid cpf.
     */
    var isValidCPF: Bool {
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        if(Set(self).isSubset(of: nums)){
            let numbers = compactMap({ Int(String($0)) })
            guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
            func digitCalculator(_ slice: ArraySlice<Int>) -> Int {
                var number = slice.count + 2
                let digit = 11 - slice.reduce(into: 0) {
                    number -= 1
                    $0 += $1 * number
                    } % 11
                return digit > 9 ? 0 : digit
            }
            let dv1 = digitCalculator(numbers.prefix(9))
            let dv2 = digitCalculator(numbers.prefix(10))
            return dv1 == numbers[9] && dv2 == numbers[10]
        }else{
            return false
        }
    }
}
