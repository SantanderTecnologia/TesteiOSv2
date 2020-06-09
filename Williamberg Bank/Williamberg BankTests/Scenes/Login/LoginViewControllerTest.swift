//
//  LoginViewControllerTest.swift
//  Williamberg BankTests
//
//  Created by padrao on 02/06/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//

@testable import Williamberg_Bank
import UIKit
import XCTest

class LoginViewControllerTest: XCTestCase {

    // MARK: - Subject under test
    
    var sut: LoginViewController!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
      super.setUp()
      window = UIWindow()
      setupLoginViewController()
    }
    
    override func tearDown()
    {
      window = nil
      super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupLoginViewController()
    {
      let bundle = Bundle.main
      let storyboard = UIStoryboard(name: "Main", bundle: bundle)
      sut = storyboard.instantiateInitialViewController() as? LoginViewController
    }
    
    func loadView()
    {
      window.addSubview(sut.view)
      RunLoop.current.run(until: Date())
    }
    
    class LoginBusinessLogicSpy: LoginBusinessLogic
    {
      // MARK: Method call expectations
      
      var loginWasCalled = false
      var getSavedUserWasCalled = false
      
      // MARK: Spied methods
      func login(request: Login.Login.Request) {
          loginWasCalled = true
      }
      
      func getSavedUser(request: Login.SavedUser.Request) {
          getSavedUserWasCalled = true
      }
    }
    
    class RouterSpy: LoginRouter{
        var routeToStatementsListWasCalled = false

        override func routeToStatementsList(segue: UIStoryboardSegue?) {
            super.routeToStatementsList(segue: segue)
            routeToStatementsListWasCalled = true
        }
    }
    
    class LoginViewControllerSpy: LoginViewController{
        var viewWillDisappearWasCalled = false
        var loginActionWasCalled = false
        
        override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
            super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        override func loginAction() {
            super.loginAction()
            loginActionWasCalled = true
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            viewWillDisappearWasCalled = true
        }
    }
    
    //MARK: Tests
    
    func testLoginAction(){
        // Given
        let loginBusinessLogicSpy = LoginBusinessLogicSpy()
        sut.interactor = loginBusinessLogicSpy
        sut.router = RouterSpy()
        
        // When
        loadView()
        sut.loginAction()
        
        // Then
        XCTAssertTrue(loginBusinessLogicSpy.loginWasCalled)
    }
    
    func testLoginIBActionAction(){
        // Given
        let loginBusinessLogicSpy = LoginBusinessLogicSpy()
        sut.interactor = loginBusinessLogicSpy
        sut.router = RouterSpy()
        
        // When
        loadView()
        sut.loginButtonAction(UIButton())
        
        // Then
        XCTAssertTrue(loginBusinessLogicSpy.loginWasCalled)
    }
    
    func testDisplayLoginResult(){
        // Given
        var userAccount: UserAccount?
        userAccount = UserAccount(userId: 0, name: "carlos", bankAccount: "1000", agency: "001", balance: 1000.0)
        let viewModel = Login.Login.ViewModel(userAccount: userAccount, errorMessage: nil)
        
        // When
        loadView()
        sut.displayLoginResult(viewModel: viewModel)
        
        XCTAssertTrue(sut.loadingButtonView.isHidden)
    }
    
    func testDisplayLoginResultWithError(){
        // Given
        let viewModel = Login.Login.ViewModel(userAccount: nil, errorMessage: nil)
        
        // When
        loadView()
        sut.displayLoginResult(viewModel: viewModel)
        
        XCTAssertTrue(sut.presentedViewController is UIAlertController)
    }
    
    func testViewDidDisappear(){
        //Given        
        // When
        loadView()
        sut.viewDidDisappear(false)
        XCTAssertFalse(sut.isBeingPresented)
    }
    
    func testViewInit(){
        let vc = LoginViewController(nibName: nil, bundle: Bundle.main)
        XCTAssertNotNil(vc)
    }
    
    func testToggleSecurityTextEntryForPasswordTextfieldNotSecureTextEntry(){
        // When
        loadView()
        sut.toggleSecurityTextEntryForPasswordTextfield()
        
        //Then
        XCTAssertFalse(sut.passwordTextfield.isSecureTextEntry)
    }
    
    func testToggleSecurityTextEntryForPasswordTextfieldSecureTextEntry(){
        // When
        loadView()
        sut.toggleSecurityTextEntryForPasswordTextfield()
        sut.toggleSecurityTextEntryForPasswordTextfield()
        
        //Then
        XCTAssert(sut.passwordTextfield.isSecureTextEntry)
    }
    
    func testKeyboardWasHide(){
        // When
        loadView()
        sut.keyboardWasHide(notification: NSNotification(name: UIResponder.keyboardWillHideNotification, object: nil))
        // Then
        XCTAssertEqual(sut.alterConstraintValue, 0)
    }
    
    func testKeyboardWasShown(){
        // When
        loadView()
        let contraintContant = sut.loginContainerCenterConstraint.constant
        let notification = NSNotification(name: UIResponder.keyboardWillShowNotification, object: nil, userInfo: ["UIKeyboardFrameEndUserInfoKey": CGRect(x: 0, y: 251, width: 375, height: 216)])
        sut.keyboardWasShown(notification: notification)
            
        // Then
        XCTAssertNotEqual(sut.loginContainerCenterConstraint.constant, contraintContant)
    }
    
    func testTextFieldShouldReturnUserTextfield(){
        // When
        loadView()
        let _ = sut.textFieldShouldReturn(sut.userTextfield)
        XCTAssert(sut.passwordTextfield.isFirstResponder)
    }
    
    func testTextFieldShouldReturnPasswordTextfield(){
        // When
        loadView()
        let _ = sut.textFieldShouldReturn(sut.passwordTextfield)
        
        //Then
        XCTAssertFalse(sut.passwordTextfield.isFirstResponder)
    }
    
    func testHideKeyboard(){
        //When
        loadView()
        sut.hideKeyboard()
        
        //Then
        XCTAssertFalse(sut.userTextfield.isFirstResponder)
        XCTAssertFalse(sut.passwordTextfield.isFirstResponder)
    }
}
