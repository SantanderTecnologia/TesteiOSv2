//
//  StatementsModelsTest.swift
//  Williamberg BankTests
//
//  Created by padrao on 06/06/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//
@testable import Williamberg_Bank
import UIKit
import XCTest

class StatementsModelsTest: XCTestCase {
    var sut: Statements.LoadUserAccount!
    
    func testViewModelNilUserAccount(){
        let viewModel = Statements.LoadUserAccount.ViewModel(userAccount: nil)
        
        XCTAssertEqual(viewModel.name, "-")
        XCTAssertEqual(viewModel.balance, "R$ 0,00")
    }
}
