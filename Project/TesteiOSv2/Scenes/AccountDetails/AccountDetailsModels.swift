//
//  AccountDetails.swift
//  TesteiOSv2
//
//  Created by Macintosh on 15/11/18.
//  Copyright (c) 2018 Roney Sampaio. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum AccountDetails
{
    
    // MARK: Response
    struct Response
    {
        var statementList: [Dictionary<String, Any>]?
        var errorMsg: String?
        var success: Bool = false
        
        init(response: [String: Any]) {
            self.statementList = response[Global.RestParams.StatementRequest.kStatementList.rawValue] as? [Dictionary<String, Any>] ?? [Dictionary<String, Any>]()
            let error: [String: Any]? = response[Global.RestParams.ErrorRequest.kError.rawValue] as? [String: Any] ?? [String: Any]()
            
            if error?.count == 0 {
                success = true
            } else {
                errorMsg = error?[Global.RestParams.ErrorRequest.kErrorMsg.rawValue] as? String ?? "defaultConnectionError".localized
            }
        }
    }
    
    
    // MARK: Statement Items
    struct StatementItem
    {
        
        var date: String
        var description: String
        var title: String
        var value: String
        
        
        init(date: String, description: String, title: String, value: String) {
            
            self.date = date
            self.description = description
            self.title = title
            self.value = value
        }
    }
}
