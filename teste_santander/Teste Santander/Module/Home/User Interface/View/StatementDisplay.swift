//
//  StatementDisplay.swift
//  Teste Santander
//
//  Created by THIAGO on 09/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

struct StatementDisplay {
    var date: String = ""
    var desc: String = ""
    var value: String = ""
    var type: String = ""
    
    static func make(item: StatementItem) -> StatementDisplay {
        var display = StatementDisplay()
        display.type =  item.title
        display.desc = item.desc
        display.value = item.value.currencyBRL
        display.date = makeDate(date: item.date)
        return display
    }
    
    static func makeDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let myString = formatter.string(from: date)
        let yourDate: Date? = formatter.date(from: myString)
        return formatter.string(from: yourDate!)
    }

}
