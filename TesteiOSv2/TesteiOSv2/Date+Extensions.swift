//
//  Date+Extensions.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//
import Foundation

extension Date{
    /**
     Extension to Date type, return a String by a date acoording the format.
     
     - parameters:
     - dateFormat format  : String.
     */
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
