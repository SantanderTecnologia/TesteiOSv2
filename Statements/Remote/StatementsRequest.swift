//
//  StatementsRequest.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 09/04/19.
//  Copyright © 2019 Lucas Brandão Pereira. All rights reserved.
//

import Foundation

class StatementsRequest: Request {
    var endpoint: String = "https://bank-app-test.herokuapp.com/api/statements/1"
    var method: HTTPMethod = .get
    
    
}
