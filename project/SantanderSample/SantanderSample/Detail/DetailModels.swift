//
//  DetailModels.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 26/10/18.
//  Copyright (c) 2018 Virgilius Santos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Detail {
  // MARK: Use cases
  
  
    struct Request: APIRequestDetail {
        typealias Response = Detail.Response
        
        var userId: Int?
    }
    
    struct Response: Codable {
        
        var name: String?
        var bankAccount: String?
        var agency: String?
        var balance: Double?
        
        var statementList = [Statement]()
        var error: DetailError?
        var success: Bool { return error?.code == nil}
    }
    
    struct DetailError: Codable {
        var code: Int?
        var message: String?
    }
    
    struct ViewModel {
        var name: String?
        var account: String?
        var balance: String?
    }
    
    struct Statement: Codable {
        var title: String
        var desc: String
        var date: String
        var value: Double
    }
  
}
