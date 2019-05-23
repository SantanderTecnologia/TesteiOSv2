//
//  LoginPresenterTests.swift
//  BankAppTests
//
//  Created by Pedro Veloso on 21/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import XCTest
@testable import BankApp

class LoginPresenterTests: XCTestCase {
    
    var initialKeychainUserInfo: String?
    var initialKeychainPasswrodInfo: String?

    var presenter: LoginPresenter! {
        didSet {
            presenter.set(view: view)
        }
    }
    var coordinator: MockCoordinator!
    var view: MockView!
    var repository: MockRepository!
    
    override func setUp() {
        initialKeychainUserInfo = KeychainHelper.shared.get(key: KeychainHelperKeys.user)
        initialKeychainPasswrodInfo = KeychainHelper.shared.get(key: KeychainHelperKeys.password)
        
        coordinator = MockCoordinator(nav: UINavigationController(), root: nil)
        repository = MockRepository()
        view = MockView()
        presenter = LoginPresenter(coordinator: coordinator, repository: repository)
    }
    
    override func tearDown() {
        KeychainHelper.shared.set(string: initialKeychainUserInfo!, forKey: KeychainHelperKeys.user)
        KeychainHelper.shared.set(string: initialKeychainPasswrodInfo!, forKey: KeychainHelperKeys.password)
    }
    
    func testIsPasswordValidWhenEmpty() {
        let isValid = presenter.isPasswordValid(password: "")
        XCTAssertFalse(isValid, "isPasswordValid(password:) should be false")
    }
    
    func testIsPasswordValidWhenLessThanThreeChars() {
        let isValid = presenter.isPasswordValid(password: "Te")
        XCTAssertFalse(isValid, "isPasswordValid(password:) should be false")
    }
    
    func testIsPasswordValidWhenAllLowercased() {
        let isValid = presenter.isPasswordValid(password: "teste@1")
        XCTAssertFalse(isValid, "isPasswordValid(password:) should be false")
    }
    
    func testIsPasswordValidWhenHaveNoSpecialChars() {
        let isValid = presenter.isPasswordValid(password: "teSte1")
        XCTAssertFalse(isValid, "isPasswordValid(password:) should be false")
    }
    
    func testIsPasswordValidWhenHaveOnlyCapitalsAndSpecialsChars() {
        let isValid = presenter.isPasswordValid(password: "SS@@!#")
        XCTAssertFalse(isValid, "isPasswordValid(password:) should be false")
    }
    
    func testIsPasswordValid() {
        let isValid = presenter.isPasswordValid(password: "Test@1")
        XCTAssertTrue(isValid, "isPasswordValid(password:) should be true")
    }
    
    func testLoginWhenUserIsNil() {
        presenter.login(user: nil, password: "pass")
        
        XCTAssertFalse(view.setLoadingHiddenWasCalled, "setLoadingHidden(isHidden:) should not be called")
        XCTAssertFalse(repository.fetchWasCalled, "fetch() should not be called")
    }
    
    func testLoginWhenPasswordIsNil() {
        presenter.login(user: "user", password: nil)
        
        XCTAssertFalse(view.setLoadingHiddenWasCalled)
        XCTAssertFalse(repository.fetchWasCalled)
    }
    
    func testLoginWhenSuccess() {
        repository.status = .success
        repository.param1 = "user"
        repository.param2 = "password"
        presenter.login(user: "user", password: "password")
        
        XCTAssertTrue(view.setLoadingHiddenWasCalled)
        XCTAssertTrue(repository.fetchWasCalled)
        
        XCTAssertEqual(KeychainHelper.shared.get(key: KeychainHelperKeys.user), "user")
        XCTAssertEqual(KeychainHelper.shared.get(key: KeychainHelperKeys.password), "password")
        XCTAssertEqual(UserHelper.shared.current, repository.login)
        
        XCTAssertTrue(coordinator.loginWasCalled)
        XCTAssertTrue(view.setLoadingHiddenWasCalled)
    }
    
    func testLoginWhenFail() {
        repository.status = .failure
        repository.param1 = "user"
        repository.param2 = "password"
        view.messageToBeSetted = NSError.generalError.domain
        presenter.login(user: "user", password: "password")
        
        
        XCTAssertTrue(repository.fetchWasCalled)
        XCTAssertFalse(coordinator.loginWasCalled)
        XCTAssertTrue(view.setLoadingHiddenWasCalled)
        XCTAssertTrue(view.showAlertWasCalled)
    }
    
    func testViewDidLoadWhenHaveNoUserAndPassword() {
        KeychainHelper.shared.clear()
        presenter.viewDidLoad()
        
        XCTAssertFalse(view.setFieldsWasCalled, "setFields(user:password:) should not be called")
    }
    
    func testViewDidLoadWhenHaveUserInfo() {
        KeychainHelper.shared.set(string: "user", forKey: KeychainHelperKeys.user)
        KeychainHelper.shared.set(string: "pass", forKey: KeychainHelperKeys.password)
        view.userToBeSetted = "user"
        view.passwordToBeSetted = "pass"
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.setFieldsWasCalled, "setFields(user:password:) should be called")
    }
    
    func testDidEditFieldsWhenBothInfoIsNil() {
        presenter.didEditFields(user: nil, password: nil)
        XCTAssertFalse(view.setButtonEnabledWasCalled, "setButtonEnabled(isEnabled:) should not be called")
    }
    
    func testDidEditFieldsWhenPasswordIsNil() {
        presenter.didEditFields(user: "user", password: nil)
        
        XCTAssertFalse(view.setButtonEnabledWasCalled, "setButtonEnabled(isEnabled:) should not be called")
    }
    
    func testDidEditFieldsWhenUserIsNil() {
        presenter.didEditFields(user: nil, password: "Test@1")
        
        XCTAssertFalse(view.setButtonEnabledWasCalled, "setButtonEnabled(isEnabled:) should not be called")
    }
    
    func testDidEditFieldsWhenUserIsEmpty() {
        view.isEnabledToBeSetted = false
        presenter.didEditFields(user: "", password: "Test@1")
        
        XCTAssertTrue(view.setButtonEnabledWasCalled, "setButtonEnabled(isEnabled:) should be called")
    }
    
    func testDidEditFieldsWhenPasswordIsInvalid() {
        view.isEnabledToBeSetted = false
        presenter.didEditFields(user: "user", password: "Test")
        
        XCTAssertTrue(view.setButtonEnabledWasCalled, "setButtonEnabled(isEnabled:) should be called")
    }
    
    func testDidEditFieldsWhenBothInfoIsValid() {
        view.isEnabledToBeSetted = true
        presenter.didEditFields(user: "user", password: "Test@1")
        
        XCTAssertTrue(view.setButtonEnabledWasCalled, "setButtonEnabled(isEnabled:) should be called")
    }
}

extension LoginPresenterTests {
    class MockCoordinator: LoginCoordinatorDelegate {
        var rootViewController: UIViewController?
        var navigation: UINavigationController
        func start() {
            XCTFail("\(#function) should not be called in this test")
        }
        required init(nav: UINavigationController, root: UIViewController?) {
            navigation = nav
            rootViewController = root
        }
        
        var loginWasCalled = false
        
        func login() {
            loginWasCalled = true
        }
    }
}

extension LoginPresenterTests {
    class MockView: LoginViewDelegate {
        var showAlertWasCalled = false
        var setLoadingHiddenWasCalled = false
        var setButtonEnabledWasCalled = false
        var setFieldsWasCalled = false
        
        var messageToBeSetted: String? = nil
        var isEnabledToBeSetted: Bool? = nil
        var userToBeSetted: String? = nil
        var passwordToBeSetted: String? = nil
        
        func showAlert(message: String) {
            XCTAssertEqual(message, messageToBeSetted)
            showAlertWasCalled = true
        }
        
        func setLoadingHidden(isHidden: Bool) {
            setLoadingHiddenWasCalled = true
        }
        
        func setButtonEnabled(isEnabled: Bool) {
            XCTAssertEqual(isEnabled, isEnabledToBeSetted)
            setButtonEnabledWasCalled = true
        }
        
        func setFields(user: String, password: String) {
            XCTAssertEqual(user, userToBeSetted)
            XCTAssertEqual(password, passwordToBeSetted)
            setFieldsWasCalled = true
        }
    }
}

extension LoginPresenterTests {
    
    class MockRepository: LoginRepositoryDelegate {
    
        enum Status {
            case success, failure, none
        }
        
        var status: Status = .none
        
        var fetchWasCalled = false
        var login: LoginModel?
        var param1: String?
        var param2: String?
        
        func fetch(params: [String : String], success: @escaping Network<LoginModel>.Success, failure: @escaping Failure) {
            
            fetchWasCalled = true
            
            XCTAssertEqual(params["user"], param1)
            XCTAssertEqual(params["password"], param2)
            
            switch status {
            case .success:
                let mock = MockLoader<LoginModel>.loadMock()
                login = mock
                success(mock)
            case .failure:
                failure(NSError.generalError)
            default:
                break
            }
        }
    }
}
