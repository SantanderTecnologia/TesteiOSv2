//
//  LoginPresenterTest.swift
//  Williamberg BankTests
//
//  Created by padrao on 01/06/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//
@testable import Williamberg_Bank
import UIKit
import XCTest

class LoginPresenterTest: XCTestCase {

    var sut: LoginPresenter!

    override func setUp()
    {
      super.setUp()
      sut = LoginPresenter()
    }
    
    class ShowLoginDisplayLogicSpy: LoginDisplayLogic
    {
        var displayLoginViewModel: Login.Login.ViewModel!
        var displayUserSavedViewModel: Login.SavedUser.ViewModel!
        
      // MARK: Spied methods
      func displayLoginResult(viewModel: Login.Login.ViewModel) {
          displayLoginViewModel = viewModel
      }
      
      func displayUserSaved(viewModel: Login.SavedUser.ViewModel) {
          displayUserSavedViewModel = viewModel
      }
    }
    
    func testPresentLoginResult(){
        // Given
        let loginDisplayLogic = ShowLoginDisplayLogicSpy()
        sut.viewController = loginDisplayLogic
        
        // When
        let name = "Carlos"
        let bankAccount = "200"
        let agency = "001"
        let balance = 1000.0
        var userAccount: UserAccount?
        userAccount = UserAccount(userId: 0, name: name, bankAccount: bankAccount, agency: agency, balance: balance)
        
        let response = Login.Login.Response(userAccount: userAccount, errorMessage: nil)
        sut.presentLoginResult(response: response)
        
        // Then
        let displayedLoginViewmodel = loginDisplayLogic.displayLoginViewModel
        XCTAssertNil(displayedLoginViewmodel?.errorMessage)
        XCTAssertEqual(name, displayedLoginViewmodel?.userAccount?.name)
        XCTAssertEqual(bankAccount, displayedLoginViewmodel?.userAccount?.bankAccount)
        XCTAssertEqual(agency, displayedLoginViewmodel?.userAccount?.agency)
        XCTAssertEqual(balance, displayedLoginViewmodel?.userAccount?.balance)
    }
}
