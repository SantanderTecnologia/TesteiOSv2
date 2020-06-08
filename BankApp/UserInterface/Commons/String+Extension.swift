//
//  String+Extension.swift
//  UserInterface
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

extension String {
    var dateFormated: String {
        let dateFormatterDate = DateFormatter()
        dateFormatterDate.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatterDate.date(from: self) else { return "" }
        let dateFormatterString = DateFormatter()
        dateFormatterString.dateFormat = "dd/MM/yyyy"
        return dateFormatterString.string(from: date)
    }
    
    var bankFormated: String {
        var characters = Array(self)
        characters.insert(".", at: 2)
        characters.insert("-", at: characters.count - 1)
        return String(characters)
    }
}
