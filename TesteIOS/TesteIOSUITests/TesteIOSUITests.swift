//
//  TesteIOSUITests.swift
//  TesteIOSUITests
//
//  Created by khalid ait bellahs on 21/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import XCTest
@testable import TesteIOS

class TesteIOSUITests: XCTestCase {
    
    let userCPFValid: String = "39728922337"
    let userCPFInValid: String = "39728922330"
    let passwordValid: String = "aaAA11@@\n"
    let passwordInValid: String = "aaAA1100\n"
    
    private func hidesKeyboard(_ app: XCUIApplication) {
        let firstKey = XCUIApplication().keys.element(boundBy: 0)
        if firstKey.exists {
            app.typeText("\n")
        }
    }
    
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // UI Test to validate Login successfully
    func testLoginSucess() {
        
        //iniciate the Aplication
        let app = XCUIApplication()
        //get user text field
        let userTextField = app.textFields["User"]
        //check user text field if exist
        XCTAssertTrue(userTextField.exists)
        //tap on the user text field
        userTextField.tap()
        //insert valid user data into user text field
        userTextField.typeText(userCPFValid)
        
        
        //get passord text field
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        //check passord text field if exist
        XCTAssertTrue(passwordSecureTextField.exists)
        //tap on the password text field
        passwordSecureTextField.tap()
        //insert valid password data into passord text field
        passwordSecureTextField.typeText(passwordValid)
        
        //get login button
        let loginButton = app.buttons["Login"]
        //check login button if exist
        XCTAssertTrue(loginButton.exists)
        
        //hiddding keyboard
        hidesKeyboard(app)
        //tap on login button
        loginButton.forceTap()
        
        
        //get logout button
        let lougouButton = app.images["logout 2"]
        
        
        let expectation = XCTKVOExpectation(keyPath: "exists", object: lougouButton,
                                            expectedValue: true)
        let _ = XCTWaiter().wait(for: [expectation], timeout: 5)
        
       
        
        
        //check logou button if exist
        XCTAssertTrue(lougouButton.exists)
        //tap on logout button
        lougouButton.forceTap()
        
        
        //get login button again
        let loginButton2 = app.buttons["Login"]
        //check login button if exist again
        XCTAssertTrue(loginButton2.exists)
        
        
        //if all steps abuve success then all right
    }
    
    
    // UI Test to validate Login with invalid user
    func testLoginInvalidUser() {
        
        //iniciate the Aplication
        let app = XCUIApplication()
        //get user text field
        let userTextField = app.textFields["User"]
        //check user text field if exist
        XCTAssertTrue(userTextField.exists)
        //tap on the user text field
        userTextField.tap()
        //insert valid user data into user text field
        userTextField.typeText(userCPFInValid)
        
        
        //get passord text field
        let passwordSecureTextField = app.secureTextFields["Password"]
        //check passord text field if exist
        XCTAssertTrue(passwordSecureTextField.exists)
        //tap on the password text field
        passwordSecureTextField.tap()
        //insert valid password data into passord text field
        passwordSecureTextField.typeText(passwordValid)
        
        //get login button
        let loginButton = app.buttons["Login"]
        //check login button if exist
        XCTAssertTrue(loginButton.exists)
        //hiddding keyboard
        hidesKeyboard(app)
        //tap on login button
        loginButton.forceTap()
        
        
        //get Error alert
        
        let expectation = XCTNSNotificationExpectation(name: NSNotification.Name(rawValue: "Nome do usuário incorreto"))
        let _ = XCTWaiter().wait(for: [expectation], timeout: 5)
        
        let nomeDoUsuRioIncorretoAlert = app.alerts["Nome do usuário incorreto"]
        //check if error alert exist
        XCTAssertTrue(nomeDoUsuRioIncorretoAlert.exists)
        //Tap action button on alert message
        nomeDoUsuRioIncorretoAlert.buttons["Tentar novamente"].tap()
        
        
        //if all steps abuve success then all right
    }
    
    
    // UI Test to validate Login with invalid password
    func testLoginInvalidPassword() {
        
        //iniciate the Aplication
        let app = XCUIApplication()
        //get user text field
        let userTextField = app.textFields["User"]
        //check user text field if exist
        XCTAssertTrue(userTextField.exists)
        //tap on the user text field
        userTextField.tap()
        //insert valid user data into user text field
        userTextField.typeText(userCPFValid)
        
        
        //get passord text field
        let passwordSecureTextField = app.secureTextFields["Password"]
        //check passord text field if exist
        XCTAssertTrue(passwordSecureTextField.exists)
        //tap on the password text field
        passwordSecureTextField.tap()
        //insert valid password data into passord text field
        passwordSecureTextField.typeText(passwordInValid)
        
        //get login button
        let loginButton = app.buttons["Login"]
        //check login button if exist
        XCTAssertTrue(loginButton.exists)
        //hiddding keyboard
        hidesKeyboard(app)
        //tap on login button
        loginButton.forceTap()
        
        
        //get Error alert
        
        let expectation = XCTNSNotificationExpectation(name: NSNotification.Name(rawValue: "Senha inválida"))
        let _ = XCTWaiter().wait(for: [expectation], timeout: 5)

        let passwordSecureIncorretoAlert = app.alerts["Senha inválida"]
        //check if error alert exist
        XCTAssertTrue(passwordSecureIncorretoAlert.exists)
        //Tap action button on alert message
        passwordSecureIncorretoAlert.buttons["Tentar novamente"].tap()
        
        //if all steps abuve success then all right
    }
    
    
    
}

extension XCUIElement {
    func forceTap() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
}
