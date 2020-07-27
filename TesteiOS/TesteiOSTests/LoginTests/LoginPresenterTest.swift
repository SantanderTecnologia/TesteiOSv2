//
//  LoginPresenterTest.swift
//  TesteIOSTests
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

@testable import TesteIOS
import XCTest

class LoginPresenterTest: XCTestCase {

        var sut: LoginPresenter!
            
        override func setUp() {
            super.setUp()
            setupLoginPresenter()
        }
            
        func setupLoginPresenter() {
            sut = LoginPresenter()
        }
              
        class LoginDisplayLogicSpy: LoginDisplayLogic {
            var getDataIsCalled = false
            var displayErrorIsCalled = false
            var fillLastUsernameIsCalled = false
        
            func getData(viewModel: LoginModel.Login.ViewModel) {
                getDataIsCalled = true
            }

            func displayErrorAlert(error: String) {
                displayErrorIsCalled = true
            }

            func fillLastUsername(username: String) {
                fillLastUsernameIsCalled = true
            }
        }
        
        func testPresentLogin() {
            let viewControllerSpy = LoginDisplayLogicSpy()
            sut.viewController = viewControllerSpy
            let response = LoginModel.Login.Response(user: nil)
            
            sut.presentLogin(response: response)
            XCTAssertTrue(viewControllerSpy.getDataIsCalled)
        }
        
        func testPresentLoginError() {
            let viewControllerSpy = LoginDisplayLogicSpy()
            sut.viewController = viewControllerSpy
            
            sut.presentLoginError(error: "erro")
            XCTAssertTrue(viewControllerSpy.displayErrorIsCalled)
        }
        
        func testGetUsername() {
            let viewControllerSpy = LoginDisplayLogicSpy()
            sut.viewController = viewControllerSpy
            
            sut.getLastUsername(username: "teste@teste.com")
            XCTAssertTrue(viewControllerSpy.fillLastUsernameIsCalled)
        }
}
