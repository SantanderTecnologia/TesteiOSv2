//
//  StatementItem.swift
//  Teste Santander
//
//  Created by THIAGO on 09/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

struct StatementItem {
    var date: Date = Date()
    var desc: String = ""
    var title: String = ""
    var value: Float = 0
    
    static func make(entity: StatementEntity) -> StatementItem {
        var item = StatementItem()
        item.date = entity.date
        item.desc = entity.desc
        item.title = entity.title
        item.value = entity.value
        return item
    }
}
