//
//  String.swift
//  BankApp
//
//  Created by resource on 16/06/19.
//  Copyright © 2019 Gabriel Faustino. All rights reserved.
//

import Foundation

extension String {
    func toDate(withFormat format: String, timeZone: TimeZone? = .current) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        return dateFormatter.date(from: self)
    }
}

