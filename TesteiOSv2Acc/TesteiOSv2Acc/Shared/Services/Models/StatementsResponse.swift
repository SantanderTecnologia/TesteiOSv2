//
//  StatementsResponse.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 25/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

struct StatementsResponse: Codable {
    let statementList: [Statement]?
    let error: ServiceError?
}
