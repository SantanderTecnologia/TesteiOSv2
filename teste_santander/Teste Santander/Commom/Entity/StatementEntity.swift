//
//  StatementEntity.swift
//  Teste Santander
//
//  Created by THIAGO on 09/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class StatementEntity {
    var date: Date = Date()
    var desc: String = ""
    var title: String = ""
    var value: Float = 0.0
    
    static func make(model: StatementModel) -> StatementEntity {
        let entity = StatementEntity()
        entity.date = model.date
        entity.desc = model.desc
        entity.title = model.title
        entity.value = model.value
        return entity
    }
}
