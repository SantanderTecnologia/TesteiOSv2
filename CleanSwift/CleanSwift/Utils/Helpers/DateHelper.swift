//
//  DateHelper.swift
//  CleanSwift
//
//  Created by Samanta Coutinho on 2019-08-20.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

class DateHelper {
    static func formatDate(string: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd"
        let date = formatter.date(from: string)
        return date?.fullFormat ?? ""
    }
}
