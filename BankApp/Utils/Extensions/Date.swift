//
//  Date.swift
//  BankApp
//
//  Created by resource on 16/06/19.
//  Copyright © 2019 Gabriel Faustino. All rights reserved.
//

import Foundation

extension Date {
    func toString(withFormat format: String, timeZone: TimeZone? = .current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        return dateFormatter.string(from: self)
    }
}
