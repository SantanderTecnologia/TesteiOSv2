//
//  SantanderAPI.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 14/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation
import Alamofire

class SantanderAPI {
    private let basePath = "https://bank-app-test.herokuapp.com/api"
    private let loginPath = "/login"
    private let statementsPath = "/statements/"
    
    static let shared = SantanderAPI()
    
    private init() {}
    
    func getLoginUrl() -> String {
        return basePath + loginPath
    }
    
    func getStatementsUrl() -> String {
        return basePath + statementsPath
    }
}
