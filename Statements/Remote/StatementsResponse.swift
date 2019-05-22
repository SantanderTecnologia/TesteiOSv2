//
//  LoginResponse.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 05/04/19.
//  Copyright © 2019 Lucas Brandão Pereira. All rights reserved.
//

import Foundation

struct StatementsResponse: Decodable{
    var statementList : [StatementList]
    
    struct StatementList : Decodable {
        
        var title: String
        var desc: String
        var date: String
        var value: Float

    }

}
