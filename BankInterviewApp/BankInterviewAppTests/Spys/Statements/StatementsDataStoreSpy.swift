//
//  StatementsDataStoreSpy.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

class StatementsDataStoreSpy: StatementsDataStore {
    
    var userData: Statements.UserData.ViewModel? {
        get {
            return Statements.UserData.ViewModel(id: 1, name: "Joao dos testes", agency: "1000", account: "12345679", balance: 36.65)
        }
        set{}
    }
    
    
}
