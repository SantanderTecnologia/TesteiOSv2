//
//  ExtratoModels.swift
//  TesteiOSv2
//
//  Created by Marcel Mendes Filho on 26/02/19.
//  Copyright (c) 2019 Accenture do Brasil Ltda. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Extrato
{
  // MARK: Use cases
    
    enum Header{
        struct Request{
            var headerData: UserAccountModel?
        }
        
        struct Response{
            var headerData: UserAccountModel?
        }
        
        struct ViewModel{
            var customerName: String?
            var accountNumber: String?
            var balance: String?
        }
    }
  
  enum Statement
  {
    struct Request
    {
    }
    
    struct Response
    {
        var statementEntries: StatementModel?
        var userMessage: String?
    }
    
    struct ViewModel
    {
        var userMessage: String?
        
        struct statementEntry{
            var title: String?
            var description: String?
            var date: String?
            var value: String?
            var dateForSorting: Date?
        }
        
        var entries: [statementEntry]?
    }
    
  }
}
