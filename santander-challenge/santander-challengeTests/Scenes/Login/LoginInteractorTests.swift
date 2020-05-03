//
//  LoginInteractorTests.swift
//  santander-challengeTests
//
//  Created by Kevin Oliveira on 03/05/20.
//  Copyright © 2020 Kevin Oliveira. All rights reserved.
//

import XCTest

// MARK: - Test Doubles

class LoginPresenterSpy: LoginPresentationLogic {
    var presentUserCalled = false
    var presentLoginCalled = false
    
    var presentedUser: String?

    var presentedLoginSuccess = false
    var presentedLoginErrorMessage: String?

    func presentUser(response: Login.GetUser.Response) {
        presentUserCalled = true
        presentedUser = response.user
    }

    func presentLogin(response: Login.Login.Response) {
        presentLoginCalled = true
        presentedLoginSuccess = response.success
        presentedLoginErrorMessage = response.errorMessage
    }
}

class LoginWorkerSuccessSpy: LoginWorkerLogic {
    var loginCalled = false
    
    func login(user: String?, password: String?, _ completion: @escaping ((User?, Bool?) -> Void)) {
        loginCalled = true

        completion(Seeds.user, nil)
    }
}

class LoginWorkerFailedSpy: LoginWorkerLogic {
    var loginCalled = false

    func login(user: String?, password: String?, _ completion: @escaping ((User?, Bool?) -> Void)) {
        loginCalled = true

        completion(nil, true)
    }
}

class UserWorkerSpy: UserWorkerLogic {
    var getUserCalled = false
    var saveUserCalled = false
    
    func saveUser(_ user: String?) {
        saveUserCalled = true
    }

    func getUser() -> String? {
        getUserCalled = true
        return Seeds.email
    }
}

// MARK: - Tests

class LoginInteractorTests: XCTestCase {

    func testGetUser() {
        // GIVEN
        let presenterSpy = LoginPresenterSpy()
        let userWorkerSpy = UserWorkerSpy()

        let interator = LoginInteractor()
        interator.presenter = presenterSpy
        interator.userWorker = userWorkerSpy

        let request = Login.GetUser.Request()

        let expectedUser = Seeds.email

        // WHEN
        interator.getUser(request: request)

        // THEN
        XCTAssertTrue(userWorkerSpy.getUserCalled)
        XCTAssertTrue(presenterSpy.presentUserCalled)
        XCTAssertEqual(presenterSpy.presentedUser, expectedUser)
    }

    func testLoginSuccessWithEmail() {
        // GIVEN
        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerSuccessSpy()
        let userWorkerSpy = UserWorkerSpy()

        let interator = LoginInteractor()
        interator.presenter = presenterSpy
        interator.worker = workerSpy
        interator.userWorker = userWorkerSpy

        let request = Login.Login.Request(user: Seeds.email, password: Seeds.password)

        // WHEN
        interator.login(request: request)

        // THEN
        XCTAssertTrue(workerSpy.loginCalled)
        XCTAssertTrue(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertTrue(presenterSpy.presentedLoginSuccess)
        XCTAssertNil(presenterSpy.presentedLoginErrorMessage)
    }

    func testLoginSuccessWithCPF() {
        // GIVEN
        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerSuccessSpy()
        let userWorkerSpy = UserWorkerSpy()

        let interator = LoginInteractor()
        interator.presenter = presenterSpy
        interator.worker = workerSpy
        interator.userWorker = userWorkerSpy

        let request = Login.Login.Request(user: Seeds.cpf, password: Seeds.password)

        // WHEN
        interator.login(request: request)

        // THEN
        XCTAssertTrue(workerSpy.loginCalled)
        XCTAssertTrue(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertTrue(presenterSpy.presentedLoginSuccess)
        XCTAssertNil(presenterSpy.presentedLoginErrorMessage)
    }

    func testLoginWithoutUserAndPassword() {
        // GIVEN
        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerSuccessSpy()
        let userWorkerSpy = UserWorkerSpy()

        let interator = LoginInteractor()
        interator.presenter = presenterSpy
        interator.worker = workerSpy
        interator.userWorker = userWorkerSpy

        let request = Login.Login.Request(user: nil, password: nil)

        // WHEN
        interator.login(request: request)

        // THEN
        XCTAssertFalse(workerSpy.loginCalled)
        XCTAssertFalse(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertFalse(presenterSpy.presentedLoginSuccess)
        XCTAssertEqual(
            presenterSpy.presentedLoginErrorMessage,
            "Não foi possível efetuar o seu login. Por favor verifique se seu usuário e senha estão corretos e tente novamente."
        )
    }

    func testLoginWithInvalidEmail() {
        // GIVEN
        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerSuccessSpy()
        let userWorkerSpy = UserWorkerSpy()

        let interator = LoginInteractor()
        interator.presenter = presenterSpy
        interator.worker = workerSpy
        interator.userWorker = userWorkerSpy

        let request = Login.Login.Request(user: "foo@email", password: Seeds.password)

        // WHEN
        interator.login(request: request)

        // THEN
        XCTAssertFalse(workerSpy.loginCalled)
        XCTAssertFalse(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertFalse(presenterSpy.presentedLoginSuccess)
        XCTAssertEqual(
            presenterSpy.presentedLoginErrorMessage,
            "Por favor informe um email ou CPF válido no campo de usuário."
        )
    }
    
    func testLoginWithInvalidCPF() {
        // GIVEN
        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerSuccessSpy()
        let userWorkerSpy = UserWorkerSpy()

        let interator = LoginInteractor()
        interator.presenter = presenterSpy
        interator.worker = workerSpy
        interator.userWorker = userWorkerSpy

        let request = Login.Login.Request(user: "123456", password: Seeds.password)

        // WHEN
        interator.login(request: request)

        // THEN
        XCTAssertFalse(workerSpy.loginCalled)
        XCTAssertFalse(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertFalse(presenterSpy.presentedLoginSuccess)
        XCTAssertEqual(
            presenterSpy.presentedLoginErrorMessage,
            "Por favor informe um email ou CPF válido no campo de usuário."
        )
    }
    
    func testLoginWithInvalidPassword() {
        // GIVEN
        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerSuccessSpy()
        let userWorkerSpy = UserWorkerSpy()

        let interator = LoginInteractor()
        interator.presenter = presenterSpy
        interator.worker = workerSpy
        interator.userWorker = userWorkerSpy

        let request = Login.Login.Request(user: Seeds.email, password: "123")

        // WHEN
        interator.login(request: request)

        // THEN
        XCTAssertFalse(workerSpy.loginCalled)
        XCTAssertFalse(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertFalse(presenterSpy.presentedLoginSuccess)
        XCTAssertEqual(
            presenterSpy.presentedLoginErrorMessage,
            "Por favor informe uma senha que contenha pelo menos uma letra maiúscula, um caracter especial e um caracter alfanumérico."
        )
    }
    
    func testLoginWithWorkerFailing() {
        // GIVEN
        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerFailedSpy()
        let userWorkerSpy = UserWorkerSpy()

        let interator = LoginInteractor()
        interator.presenter = presenterSpy
        interator.worker = workerSpy
        interator.userWorker = userWorkerSpy

        let request = Login.Login.Request(user: Seeds.email, password: Seeds.password)

        // WHEN
        interator.login(request: request)

        // THEN
        XCTAssertTrue(workerSpy.loginCalled)
        XCTAssertFalse(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertFalse(presenterSpy.presentedLoginSuccess)
        XCTAssertEqual(
            presenterSpy.presentedLoginErrorMessage,
            "Não foi possível efetuar o seu login. Por favor verifique se seu usuário e senha estão corretos e tente novamente."
        )
    }
}
