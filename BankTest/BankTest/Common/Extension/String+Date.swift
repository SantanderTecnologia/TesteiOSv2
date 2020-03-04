//
//  String+Date.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import Foundation

extension String {

    func toDate(from: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = from
        return formatter.date(from: self)
    }
}
