//
//  Seeds.swift
//  TCS_ChallengeTests
//
//  Created by Rafael Valer on 15/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

@testable import TCS_Challenge
import XCTest

struct Seeds {
    
    struct Statements {
        
        static let tedStatement = Statement(title: "TED Recebida",
                                            desc: "Rafael Cruz",
                                            date: "2019-10-02",
                                            value: 1550)
        
    }
    
    struct AccountsInfos {
        
        static let amy = AccountInfo(userId: 3124,
                                        name: "Amy Lala Vas",
                                        bankAccount: "312351",
                                        agency: "2321",
                                        balance: 45120.90)
    }
}
