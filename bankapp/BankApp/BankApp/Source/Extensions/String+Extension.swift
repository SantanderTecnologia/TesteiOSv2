//
//  String+Extension.swift
//  BankApp
//
//  Created by Pedro Veloso on 21/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

extension String {
    var toDate: String? {
        let df = DateFormatter()
        df.locale = Locale.autoupdatingCurrent
        df.timeZone = TimeZone.autoupdatingCurrent
        df.dateFormat = "yyyy-MM-dd"
        guard let date = df.date(from: self) else { return nil }
        df.dateFormat = "dd/MM/yyyy"
        return df.string(from: date)
    }
}
