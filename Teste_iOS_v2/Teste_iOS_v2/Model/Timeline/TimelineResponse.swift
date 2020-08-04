//
//  TimelineResponse.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation

struct TimelineResponse: Codable {
    let list: [TimelineModel]
    
    enum CodingKeys: String, CodingKey {
        case list = "statementList"
    }
}
