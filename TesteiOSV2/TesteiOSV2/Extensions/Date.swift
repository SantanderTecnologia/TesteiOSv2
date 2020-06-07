//
//  Date.swift
//  TesteiOSV2
//
//  Created by Julio Cezar de Souza on 06/06/20.
//  Copyright © 2020 Julio Souza. All rights reserved.
//

import UIKit

extension Date {
    
    func toString(format: String = "dd/MM/yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: self)
    }
}
