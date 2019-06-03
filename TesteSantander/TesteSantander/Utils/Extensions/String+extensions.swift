//
//  String+extensions.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 29/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation

extension String {
    
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
    
    var isCPF: Bool {
        let cpf = self.onlyNumbers()
        guard cpf.count == 11 else { return false }
        
        let index1 = cpf.index(cpf.startIndex, offsetBy: 9)
        let index2 = cpf.index(cpf.startIndex, offsetBy: 10)
        let index3 = cpf.index(cpf.startIndex, offsetBy: 11)
        let digit1 = Int(cpf[index1..<index2])
        let digit2 = Int(cpf[index2..<index3])
        
        var temp1 = 0, temp2 = 0
        
        for index in 0...8 {
            let start = cpf.index(cpf.startIndex, offsetBy: index)
            let end = cpf.index(cpf.startIndex, offsetBy: index+1)
            let char = Int(cpf[start..<end]) ?? 0
            
            temp1 += char * (10 - index)
            temp2 += char * (11 - index)
        }
        
        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1
        
        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2
        
        return temp1 == digit1 && temp2 == digit2
    }
    
    func onlyNumbers() -> String {
        guard !isEmpty else { return "" }
        return replacingOccurrences(of: "\\D",
                                    with: "",
                                    options: .regularExpression,
                                    range: startIndex..<endIndex)
    }
    
    func formatData() -> String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        
        if let date = dateFormatterGet.date(from: self) {
            return dateFormatterPrint.string(from: date)
        } else {
            return nil
        }
    }
    
}
