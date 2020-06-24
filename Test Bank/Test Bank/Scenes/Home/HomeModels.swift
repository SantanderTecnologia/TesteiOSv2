//
//  HomeModels.swift
//  Test Bank
//
//  Created by Lucas Santana Brito on 23/06/20.
//  Copyright (c) 2020 lsb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Home {
  // MARK: Use cases
    struct Request {
        
    }
    
    struct Response {
        var account: Login.UserAccount?
    }
    
    struct ViewModel {
        var name: String
        var bankAccount: String
        var agency: String
        var balance: Double
    }
    
    struct StatementList: Decodable {
        var statementList: [Statement]
    }
    
    struct Statement: Decodable {
        var title: String
        var desc: String
        var date: String
        var value: Double
    }
}
