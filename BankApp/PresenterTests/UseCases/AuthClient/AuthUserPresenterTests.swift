//
//  AuthUserPresenterTests.swift
//  PresenterTests
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
import Domain
@testable import Presenter

class AuthUserPresenterTests: XCTestCase {

    func testAuthUserShowMessageErrorWhenPasswordDontInformated() throws {
        
        //Given
        let alertViewSpy = AlertViewSpy()
        let sut = createSutWith(alertViewSpy: alertViewSpy)
        let authUserViewModel = createAuthUserViewModel(password: nil)
        let alertViewModel = AlertViewModel(title: "Fail in auth the user", message: "The field Password is mandatory")
        
        //When
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        alertViewSpy.observerViewModel { (viewModel) in
            XCTAssertEqual(viewModel, alertViewModel)
        }
    }
    
    func testAuthUserShowMessageErrorWhenUserNameDontInformated() throws {
        
        //Given
        let alertViewSpy = AlertViewSpy()
        let sut = createSutWith(alertViewSpy: alertViewSpy)
        let authUserViewModel = createAuthUserViewModel(userName: nil)
        let alertViewModel = AlertViewModel(title: "Fail in auth the user", message: "The field User Name is mandatory")
        
        //When
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        alertViewSpy.observerViewModel { (viewModel) in
            XCTAssertEqual(viewModel, alertViewModel)
        }
    }
    
    func testFuncStringCheckWhenPutStringInvalid() throws {
        
        //Given
        let stringNil: String? = nil
        let stringEmpty: String = ""
        
        //When
        let isValid = false
        
        //Then
        XCTAssertEqual(isValid, StringCheck.isValidField(stringNil))
        XCTAssertEqual(isValid, StringCheck.isValidField(stringEmpty))
    }
    
    func testFuncStringCheckWhenPutStringValid() throws {
        
        //Given
        let stringValid: String = "stringValid"
        
        //When
        let isValid = true
        
        //Then
        XCTAssertEqual(isValid, StringCheck.isValidField(stringValid))
    }
    
    func testIfUserNameValidatorHasBeenCalled() throws {
        
        //Given
        let userNameValidateSpy = ValidateSpy()
        let sut = createSutWith(userNameValidateSpy: userNameValidateSpy)
        let authUserViewModel = createAuthUserViewModel(userName: nil)
        
        //When
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        XCTAssertEqual(userNameValidateSpy.userName, authUserViewModel.userName)
    }
    
    func testShowErrorWhenInvalidUserName() throws {
        
        //Given
        let alertViewSpy = AlertViewSpy()
        let userNameValidateSpy = ValidateSpy()
        let sut = createSutWith(alertViewSpy: alertViewSpy, userNameValidateSpy: userNameValidateSpy)
        let authUserViewModel = createAuthUserViewModel()
        let alertViewModel = AlertViewModel(title: "The field User Name is wrong", message: "You should put an email or cpf valid")
        
        //When
        userNameValidateSpy.makeInvalid()
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        alertViewSpy.observerViewModel { (viewModel) in
            XCTAssertEqual(viewModel, alertViewModel)
        }
    }
    
    func testAuthUserWithAllValuesIformated() throws {
        
        //Given
        let authClientUseCaseSpy = AuthClientUseCaseSpy()
        let sut = createSutWith(authClientUseCaseSpy: authClientUseCaseSpy)
        let authUserViewModel = createAuthUserViewModel()
        let authClientModel = createAuthClientModel()
        
        //When
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        XCTAssertEqual(authClientUseCaseSpy.authClientModel, authClientModel)
    }
    
    func testShowErrorWhenAuthClientCompleteWithError() throws {
        
        //Given
        let alertViewSpy = AlertViewSpy()
        let authClientUseCaseSpy = AuthClientUseCaseSpy()
        let sut = createSutWith(authClientUseCaseSpy: authClientUseCaseSpy, alertViewSpy: alertViewSpy)
        let authUserViewModel = createAuthUserViewModel()
        let alertViewModel = AlertViewModel(title: "Fail", message: "An unexpected error occurred, try again")
        
        //When
        sut.auth(viewModel: authUserViewModel)
        authClientUseCaseSpy.completeWith(error: .unknown)
        
        //Then
        alertViewSpy.observerViewModel { (viewModel) in
            XCTAssertEqual(viewModel, alertViewModel)
        }
    }
    
    func testLoadingBeforeAuthClientAndAfterAuthClient() throws {
        
        //Given
        let loadingViewSpy = LoadingViewSpy()
        let authClientUseCaseSpy = AuthClientUseCaseSpy()
        let sut = createSutWith(loadingViewSpy: loadingViewSpy, authClientUseCaseSpy: authClientUseCaseSpy)
        let authUserViewModel = createAuthUserViewModel()
        
        
        //Then Auth Called
        let expectationAuthCalled = expectation(description: "Waiting auth client called")
        loadingViewSpy.observerLoading { (isLoading) in
            XCTAssertTrue(isLoading)
            expectationAuthCalled.fulfill()
        }
        
        //When Auth Called
        sut.auth(viewModel: authUserViewModel)
        wait(for: [expectationAuthCalled], timeout: 1)
        
        //Then Auth Complete
        let expectationAuthComplete = expectation(description: "Waiting auth client complete")
        loadingViewSpy.observerLoading { (isLoading) in
            XCTAssertFalse(isLoading)
            expectationAuthComplete.fulfill()
        }
        
        //When Auth Complete
        authClientUseCaseSpy.completeWith(error: .unknown)
        wait(for: [expectationAuthComplete], timeout: 1)
    }
    
    func testShowSuccessWhenAuthClientCompleteWithSuccess() throws {
        
        //Given
        let authClientUseCaseSpy = AuthClientUseCaseSpy()
        let routerSpy = RouterSpy()
        let sut = createSutWith(authClientUseCaseSpy: authClientUseCaseSpy, routerSpy: routerSpy)
        let authUserViewModel = createAuthUserViewModel()
        
        //Then
        let expectationAuthComplete = expectation(description: "Waiting auth client complete")
        routerSpy.observerUserAccount { userAccount in
            XCTAssertEqual(userAccount, userAccountModel)
            expectationAuthComplete.fulfill()
        }
        
        //When
        sut.auth(viewModel: authUserViewModel)
        authClientUseCaseSpy.completeWith(model: userAccountResponse)
        wait(for: [expectationAuthComplete], timeout: 1)
    }
    
    func testShowErrorWhenUserPutPasswordDoestMeetRequirements() throws {

        //Given
        let alertViewSpy = AlertViewSpy()
        let passwordValidator = ValidateSpy()
        let sut = createSutWith(alertViewSpy: alertViewSpy, passwordValidateSpy: passwordValidator)
        let authUserViewModel = createAuthUserViewModel(password: "123456")
        let alertViewModel = AlertViewModel(title: "Your password does not meet prerequisites",
                                            message: "Should contains an Uppercase letter, a number and special character")
        
        //When
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        alertViewSpy.observerViewModel { (viewModel) in
            XCTAssertEqual(viewModel, alertViewModel)
        }
    }
    
    //TODO: - Teste RetrieveCredentials
}

extension AuthUserPresenterTests {
    
    func createSutWith(
        loadingViewSpy: LoadingViewSpy = LoadingViewSpy(),
        authClientUseCaseSpy: AuthClientUseCaseSpy = AuthClientUseCaseSpy(),
        alertViewSpy: AlertViewSpy = AlertViewSpy(),
        userNameValidateSpy: ValidateSpy = ValidateSpy(),
        passwordValidateSpy: ValidateSpy = ValidateSpy(),
        routerSpy: RouterSpy = RouterSpy(),
        retrieveCredentialsSpy: RetrieveCredentialsSpy = RetrieveCredentialsSpy(),
        file: StaticString = #file,
        line: UInt = #line) -> AuthUserPresenter {
        let authUserPresenter = AuthUserPresenter(alertView: alertViewSpy,
                                                  loadingView: loadingViewSpy,
                                                  userNameValidate: userNameValidateSpy,
                                                  passwordValidate: passwordValidateSpy,
                                                  authClientUseCase: authClientUseCaseSpy,
                                                  router: routerSpy,
                                                  retrieveCredentials: retrieveCredentialsSpy)
        memoryLeakCheckWith(instance: authUserPresenter)
        return authUserPresenter
    }
    
    func createAuthUserViewModel(userName: String? = "Test Name Drive", password: String? = "Passw1rd@dd") -> AuthUserViewModel {
        return .init(userName: userName, password: password)
    }
    
    func createAuthClientModel(user: String = "Test Name Drive", password: String = "Passw1rd@dd") -> AuthClientModel {
        return .init(user: user, password: password)
    }
}
