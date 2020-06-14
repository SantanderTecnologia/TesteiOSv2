//
//  StringExtensions.swift
//  TesteiOSv2
//
//  Created by Foliveira on 14/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation

extension String {
    
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        if let date = dateFormatter.date(from: self) {
            
            dateFormatter.dateFormat = "dd/MM/YYYY"
            
            return dateFormatter.string(from: date)
        }
        
        return ""
    }
}
