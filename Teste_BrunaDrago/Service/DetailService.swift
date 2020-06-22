//
//  DetailService.swift
//  Teste_BrunaDrago
//
//  Created by Bruna Fernanda Drago on 20/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import Foundation

struct DetailService : Decodable {
    
    var statementList:[StatementList]
}
struct StatementList:Decodable{
    var title:String?
    var desc:String?
    var date:String?
    var value:Double?
}
