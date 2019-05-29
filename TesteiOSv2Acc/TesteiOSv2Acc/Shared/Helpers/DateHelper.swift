//
//  DateHelper.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 26/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

import Foundation

class DateHelper {

    private init(){}
    
    static func convertDateString(value: String?, inputPattern: String, outputPattern: String) -> String
    {
        
        guard let value = value else {
            return ""
        }
        
        var date = ""
        let formatter = DateFormatter()
        
        formatter.dateFormat = inputPattern
        if let dateTemp = formatter.date(from: value)
        {
            formatter.dateFormat = outputPattern
            date = formatter.string(from:dateTemp)
        }
        
        return date
    }
    
}
