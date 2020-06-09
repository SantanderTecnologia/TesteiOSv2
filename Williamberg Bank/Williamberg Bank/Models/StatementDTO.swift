//
//  StatementDTO.swift
//  Williamberg Bank
//
//  Created by padrao on 24/05/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//

import Foundation

struct StatementDTO: Decodable {
    let statementList: [Statement]?
}
