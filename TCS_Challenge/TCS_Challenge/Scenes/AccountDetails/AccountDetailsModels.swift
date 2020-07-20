//
//  AccountDetailsModels.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

enum AccountDetails {
    
    // MARK: Use cases
    
    enum FetchAccountInfo {
        
        struct Response {
            var accountInfo: AccountInfo
        }
        
        struct ViewModel {
            struct DisplayedAccountInfo {
                var name: String
                var account: String
                var balance: String
            }
            var displayedAccountInfo: DisplayedAccountInfo
        }
    }
    
    enum FetchStatements {
        
        struct Request {
            let userId: String
        }
        
        struct Response: Decodable {
            var statementList: [Statement]
        }
        
        struct ViewModel {
            struct DisplayedStatement {
                var title: String
                var desc: String
                var date: String
                var value: String
            }
            var displayedStatements: [DisplayedStatement]
        }
    }
}
