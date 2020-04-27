//
//  HomeResponse.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 26/04/20.
//  Copyright © 2020 Bank. All rights reserved.
//

struct HomeResponse: Codable {
    var statementList: [Statement]
    var error: Error
}

struct Statement: Codable {
    var title: String
    var desc: String
    var date: String
    var value: Float
}
