//
//  UserInterfaceTests.swift
//  UserInterfaceTests
//
//  Created by Estaife Lima on 05/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
@testable import UserInterface
import Presenter
import Domain

import UIKit

class LoginViewControllerTests: XCTestCase {

    func testifHiddenLoadingViewWhenStart() throws {
        //Given
        let sut = LoginViewController()
        
        //When
        sut.loadViewIfNeeded()
        
        //Then
        XCTAssertEqual(sut.isLoading, false)
    }
    
    func testLoginViewControllerConformToLoadingViewProtocol() throws {
        //Given
        let sut: LoginViewController = LoginViewController()
        
        //When
        let comformToLoadingViewProtocol = sut as LoadingViewProtocol
         
        //Then
        XCTAssertNotNil(comformToLoadingViewProtocol)
    }
    
    func testLoginViewControllerConformToAlertViewProtocol() throws {
        //Given
        let sut: LoginViewController = LoginViewController()
        
        //When
        let comformToAlertViewProtocol = sut as AlertViewProtocol
         
        //Then
        XCTAssertNotNil(comformToAlertViewProtocol)
    }
    
    func testLoginButtonDidTap() throws {
        //Given
        let sut: LoginViewController = LoginViewController()
        var callLogin = false
        
        //When
        sut.loginBlock = { viewModel in
            callLogin = true
        }
        sut.simulateTap()
         
        //Then
        XCTAssertEqual(callLogin, true)
    }
    
    func testLoginButtonWhenTapped() throws {
        //Given
        let sut: LoginViewController = LoginViewController()
        var callLogin = false
        
        //When
        sut.loginBlock = { viewModel in
            callLogin = true
        }
        sut.simulateTap()
         
        //Then
        XCTAssertEqual(callLogin, true)
    }
    
    func testLoginButtonWhenTappedWithCorretViewModel() throws {
        //Given
        let sut: LoginViewController = LoginViewController()
        let loginViewModel = AuthUserViewModel(userName: sut.userText, password: sut.passwordText)
        var loginViewModelReceived: AuthUserViewModel?
        
        //When
        sut.loginBlock = { loginViewModelReceived = $0 }
        sut.simulateTap()
         
        //Then
        XCTAssertEqual(loginViewModel, loginViewModelReceived)
    }
    
    func testAlertWasShowed() throws {
        //Given
        let sut: LoginViewController = LoginViewController()
        
        //When
        let exp = expectation(description: "Test after 1 seconds wait")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)
        sut.presentMessageWith(AlertViewModel(title: "", message: ""))
        
        //Then
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.isAlertShowing)
        } else {
            XCTFail("There was no delay")
        }
    }
    
    func testAlertWasNotShowed() throws {
        //Given
        let sut: LoginViewController = LoginViewController()
        
        //When
        let exp = expectation(description: "Test after 1 seconds wait")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)
        
        //Then
        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.isAlertShowing)
        } else {
            XCTFail("There was no delay")
        }
    }
}
