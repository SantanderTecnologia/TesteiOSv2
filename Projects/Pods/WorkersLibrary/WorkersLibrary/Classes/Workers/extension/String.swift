//
//  extensionString.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 24/03/21.
//

import Foundation

extension String
{
      
      public var isRealCPF: Bool
      {
            let numbers = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            guard numbers.count == 11 else { return false }
            
            let set = NSCountedSet(array: Array(numbers))
            guard set.count != 1 else { return false }
            
            let i1 = numbers.index(numbers.startIndex, offsetBy: 9)
            let i2 = numbers.index(numbers.startIndex, offsetBy: 10)
            let i3 = numbers.index(numbers.startIndex, offsetBy: 11)
            let d1 = Int(numbers[i1..<i2])
            let d2 = Int(numbers[i2..<i3])
            
            var temp1 = 0, temp2 = 0
            
            for number in 0...8
            {
                  let start = numbers.index(numbers.startIndex, offsetBy: number)
                  let end = numbers.index(numbers.startIndex, offsetBy: number + 1)
                  let char = Int(numbers[start..<end])
                  
                  temp1 += char! * (10 - number)
                  temp2 += char! * (11 - number)
            }
            
            temp1 %= 11
            temp1 = temp1 < 2 ? 0 : 11-temp1
            
            temp2 += temp1 * 2
            temp2 %= 11
            temp2 = temp2 < 2 ? 0 : 11-temp2
            
            return temp1 == d1 && temp2 == d2
      }
      
      public var isRealCNPJ: Bool
      {
            let numbers = self.compactMap({Int(String($0))})
            guard numbers.count == 14 && Set(numbers).count != 1 else { return false }
            let soma1 = 11 - ( numbers[11] * 2 +
                                    numbers[10] * 3 +
                                    numbers[9] * 4 +
                                    numbers[8] * 5 +
                                    numbers[7] * 6 +
                                    numbers[6] * 7 +
                                    numbers[5] * 8 +
                                    numbers[4] * 9 +
                                    numbers[3] * 2 +
                                    numbers[2] * 3 +
                                    numbers[1] * 4 +
                                    numbers[0] * 5 ) % 11
            let dv1 = soma1 > 9 ? 0 : soma1
            let soma2 = 11 - ( numbers[12] * 2 +
                                    numbers[11] * 3 +
                                    numbers[10] * 4 +
                                    numbers[9] * 5 +
                                    numbers[8] * 6 +
                                    numbers[7] * 7 +
                                    numbers[6] * 8 +
                                    numbers[5] * 9 +
                                    numbers[4] * 2 +
                                    numbers[3] * 3 +
                                    numbers[2] * 4 +
                                    numbers[1] * 5 +
                                    numbers[0] * 6 ) % 11
            let dv2 = soma2 > 9 ? 0 : soma2
            return dv1 == numbers[12] && dv2 == numbers[13]
      }
      
}
