//
//  Date+Parse.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import Foundation

extension Date {

    func toString(to: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = to
        return formatter.string(from: self)
    }
}
