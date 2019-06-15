//
//  StringToDate+Extensions.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 16/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

extension String{
    /**
     Returns a date from a string.
     */
    func toDate() -> Date
    {
        let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy'-'MM'-'dd"
        let dateFromString = dateFormatter.date(from: self)!
        return dateFromString
    
    }
}
