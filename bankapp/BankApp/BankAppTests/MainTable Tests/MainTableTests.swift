//
//  MainTableTests.swift
//  BankAppTests
//
//  Created by Pedro Veloso on 22/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import XCTest
@testable import BankApp

class MainTableTests: XCTestCase {
    
    var presenter: MainTablePresenterDelegate! {
        didSet {
            presenter.set(view: view)
        }
    }
    var view: MockView!
    var coordinator: MockCoordinator!
    var repository: MockRepository!
    
    var initialKeychainUserInfo: String!
    var initialKeychainPassInfo: String!
    
    override func setUp() {
        coordinator = MockCoordinator(nav: UINavigationController(), root: nil)
        repository = MockRepository()
        view = MockView()
        presenter = MainTablePresenter(coordinator: coordinator, repository: repository)
        
        UserHelper.shared.initializeUser(login: MockLoader<LoginModel>.loadMock())
        
        initialKeychainUserInfo = KeychainHelper.shared.get(key: KeychainHelperKeys.user)
        initialKeychainPassInfo = KeychainHelper.shared.get(key: KeychainHelperKeys.password)
    }

    override func tearDown() {
        KeychainHelper.shared.set(string: initialKeychainUserInfo, forKey: KeychainHelperKeys.user)
        KeychainHelper.shared.set(string: initialKeychainPassInfo, forKey: KeychainHelperKeys.password)
    }

    func testBankInfoWhenUserIsNil() {
        UserHelper.shared.clear()
        XCTAssertEqual(presenter.bankInfo, "")
    }
    
    func testBankInfoWhenUserHasInfo() {
        XCTAssertEqual(presenter.bankInfo, "2050 / 012314564")
    }
    
    func testBalanceInfoWhenUserIsNil() {
        UserHelper.shared.clear()
        XCTAssertEqual(presenter.balanceInfo, "")
    }
    
    func testBalanceInfoWhenUserHasInfo() {
        XCTAssertEqual(presenter.balanceInfo, "R$ 3,34")
    }
    
    func testUserNameWhenUserIsNil() {
        UserHelper.shared.clear()
        XCTAssertEqual(presenter.userName, "")
    }
    
    func testUserNameWhenUserHasName() {
        XCTAssertEqual(presenter.userName, "Jose da Silva Teste")
    }
    
    func testViewDidLoadWhenUserIdIsNil() {
        UserHelper.shared.clear()
        presenter.viewDidLoad()
        
        XCTAssertFalse(repository.fetchWasCalled, "fetch() should not be called")
    }
    
    func testViewDidLoadWhenFetchIsSuccessful() {
        repository.status = .success
        repository.idToBeSetted = UserHelper.shared.current!.id
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.reloadDataWasCalled, "reloadData() should be called")
        XCTAssertFalse(view.showAlertWasCalled, "showAlert(message:) should not be called")
    }
    
    func testViewDidLoadWhenFetchFails() {
        repository.status = .failure
        repository.idToBeSetted = 1
        view.messageToBeSetted = NSError.generalError.domain
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.showAlertWasCalled, "showAlert(message:) should be called")
        XCTAssertFalse(view.reloadDataWasCalled, "reloadData() should not be called")
    }
    
    func testNumberOfRowsWhenStatementIsNil() {
        XCTAssertEqual(presenter.numberOfRows, 0)
    }
    
    func testNumberOfRowsWhenStatementIsNotNil() {
        repository.status = .success
        repository.idToBeSetted = 1
        presenter.viewDidLoad() //fill statement model
        XCTAssertEqual(presenter.numberOfRows, 9)
    }
    
    func testStatementForIndexWhenStatementIsNil() {
        XCTAssertNil(presenter.statement(for: 0), "statement(for index:) should return nil")
    }
    
    func testStatementForIndexWhenStatementIsNotNil() {
        repository.status = .success
        repository.idToBeSetted = 1
        presenter.viewDidLoad() //fill statement model
        let expectedStatement = MockLoader<StatementWrapper>.loadMock().statementList[0]
        XCTAssertEqual(presenter.statement(for: 0)!, expectedStatement)
    }
    
    func testLogout() {
        UserHelper.shared.initializeUser(login: MockLoader<LoginModel>.loadMock())
        presenter.logout()
        
        XCTAssertNil(KeychainHelper.shared.get(key: KeychainHelperKeys.user), "Keychain user info should be cleaned")
        XCTAssertNil(KeychainHelper.shared.get(key: KeychainHelperKeys.password), "Keychain password info should be cleaned")
        XCTAssertNil(UserHelper.shared.current, "Keychain user info should be cleaned")
        
        XCTAssertTrue(coordinator.logoutWasCalled, "coordinator.logout() should be called")
    }
}

extension MainTableTests {
    class MockCoordinator: MainTableCoordinatorDelegate {
        var rootViewController: UIViewController?
        var navigation: UINavigationController
        func start() {
            XCTFail("\(#function) should not be called in this test")
        }
        required init(nav: UINavigationController, root: UIViewController?) {
            navigation = nav
            rootViewController = root
        }
        
        var logoutWasCalled = false
        
        func logout() {
            logoutWasCalled = true
        }
    }
}

extension MainTableTests {
    class MockView: MainTableViewDelegate {
        var reloadDataWasCalled = false
        var showAlertWasCalled = false
        
        var messageToBeSetted: String?
        
        func reloadData() {
            reloadDataWasCalled = true
        }
        
        func showAlert(message: String) {
            XCTAssertEqual(message, messageToBeSetted)
            showAlertWasCalled = true
        }
    }
}

extension MainTableTests {
    
    class MockRepository: MainTableRepositoryDelegate {
        
        enum Status {
            case success, failure, none
        }
        
        var status: Status = .none
        var fetchWasCalled = false
        var idToBeSetted: Int?
        
        func fetch(id: Int, success: @escaping MainTableSuccess, failure: @escaping Failure) {
            XCTAssertEqual(id, idToBeSetted)
            fetchWasCalled = true
            switch status {
            case .success:
                success(MockLoader<StatementWrapper>.loadMock().statementList)
                break
            case .failure:
                failure(NSError.generalError)
                break
            default:
                break
            }
        }
    }
}
