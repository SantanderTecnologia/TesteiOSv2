//
//  LocalDbMock.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import Foundation

class LocalDbMock: LocalUserStore {
    
    var user: String?
    
    func fetchUser() -> String? {
        return user
    }
    
    func storeUser(user: String) {
        self.user = user
    }
    
}
