//
//  DetailModels.swift
//  TesteiOSV2
//
//  Created by Julio Cezar de Souza on 05/06/20.
//  Copyright (c) 2020 Julio Souza. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Detail
{
    // MARK: Use cases
    
    enum Something
    {
        struct Request
        {
        }
        struct Response {
            let statementList: [StatementList]
            let error: Error
        }
        
        struct StatementList: Codable {
            let title: String?
            let desc: String?
            let date: String?
            let value: Double?
        }
        
        struct Error: Codable {
            let code: Int?
            let message: String?
        }
    }
}
