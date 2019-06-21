//
//  String+DateFormatter.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 14/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation

extension String {
    func convertoToDate(input: String, output: String) -> String? {       
        var date = ""
        let formatter = DateFormatter()
        
        formatter.dateFormat = input
        if let dateTemp = formatter.date(from: self)
        {
            formatter.dateFormat = output
            date = formatter.string(from:dateTemp)
        }
        
        return date
    }
}
