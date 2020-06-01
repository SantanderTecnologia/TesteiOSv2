//
//  Date.swift
//  BankApp
//
//  Created by Lynneker Souza on 5/30/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import UIKit

extension Date {
    
    fileprivate func dateFormatted(format: String, localeIdentifier: String = "pt-BR") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: localeIdentifier)
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func toString(withFormat format: String) -> String {
        return dateFormatted(format: format, localeIdentifier: "pt-BR")
    }
    
    /// Initializes Date from string and format
    public init?(fromString string: String, format: String, localeIdentifier: String = "en-US") {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: localeIdentifier)
        formatter.dateFormat = format
        if let date = formatter.date(from: string) {
            self = date
        } else {
            return nil
        }
    }
    
    /// Initializes Date from string and format pt-BR formated
    public init?(fromStringPTBR string: String, format: String) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt-BR")
        formatter.dateFormat = format
        if let date = formatter.date(from: string) {
            self = date
        } else {
            return nil
        }
    }
    
    /// Get the month and year from the date
    public var monthAndYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "LLLL / yyyy"
        
        return dateFormatter.string(from: self).capitalized
    }
    
}
