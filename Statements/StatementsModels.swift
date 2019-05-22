//
//  StatementsModels.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 05/04/19.
//  Copyright (c) 2019 Lucas Brandão Pereira. All rights reserved.

import UIKit

enum Statements {
  // MARK: Use cases
  
    enum FetchStatements {
        struct Request {}
        struct Response {
            var statementsData: UITableViewDataSource?
            var numberOfItems: Int
        }
        struct ViewModel {
            var statementsData: UITableViewDataSource?
            var numberOfitems: Int
        }
    }
    
    
    
    enum PreviousScreen{
        struct Request {}
        struct Response {
            var userInfo: UserInfo
        }
        struct ViewModel {
            var userInfo: UserInfo
        }
    }
}
