//
//  DateExtension.swift
//  TesteiOSv2
//
//  Created by Mônica Marques on 18/03/20.
//  Copyright © 2020 Mônica Marques. All rights reserved.
//

import Foundation

extension Date {
    
    func toString(format: String = "dd/MM/yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
