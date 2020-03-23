//
//  DateExtension.swift
//  BankApp
//
//  Created by apple on 23/03/20.
//  Copyright © 2020 Barbara_Aniele. All rights reserved.
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
