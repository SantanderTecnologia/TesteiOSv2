@testable import BankApp
import XCTest

class UserWorkerTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: UserWorker!
    static var testUser: User!
    static var loggedAccount: UserAccount!
    static var loginError: UserStoreError!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupUserWorker()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupUserWorker()
    {
        sut = UserWorker(loginStore: LoginStoreSpy())
        
        UserWorkerTests.loggedAccount = Seeds.UserInfo.loggedAccount
        UserWorkerTests.loginError = .CannotLogin("")
    }
    
    class LoginStoreSpy: LoginAPI
    {
        // MARK: Method call expectations
        
        var fetchUserCalled = false
        
        // MARK: Spied methods
        
        override func loginUser(_ user: User, completionHandler: @escaping (UserAccount?, UserStoreError?) -> Void) {
            fetchUserCalled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                if user.password.isEmpty || user.user.isEmpty {
                    completionHandler(nil, UserWorkerTests.loginError)
                } else {
                    completionHandler(UserWorkerTests.loggedAccount, nil)
                }
            }
        }
    }
    
    func testFetchLoginShouldReturnLogin()
    {
        // Given
        let loginMemStoreSpy = sut.loginStore as! LoginStoreSpy
        
        // When
        let userToLogin = User(user: "user", password: "pass")
        var userAccout: UserAccount?
        var errorAccount: UserStoreError?
        let expect = expectation(description: "Wait for fetchLogin() to return")
        sut.loginStore.loginUser(userToLogin) { (account, error) in
            userAccout = account
            errorAccount = error
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.1)
        
        // Then
        XCTAssert(loginMemStoreSpy.fetchUserCalled, "Calling loginUser() should ask the data store for a user")
        XCTAssertEqual(userAccout, UserWorkerTests.loggedAccount, "loginUser() should return a user")
        XCTAssertNil(errorAccount, "loginUser() should return a error")
    }
    
    func testFetchLoginShouldReturnError()
    {
        // Given
        let loginMemStoreSpy = sut.loginStore as! LoginStoreSpy
        
        // When
        let userToLogin = User(user: "", password: "")
        var userAccout: UserAccount?
        var errorAccount: UserStoreError?
        let expect = expectation(description: "Wait for fetchLogin() to return")
        sut.loginStore.loginUser(userToLogin) { (account, error) in
            userAccout = account
            errorAccount = error
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.1)
        
        // Then
        XCTAssert(loginMemStoreSpy.fetchUserCalled, "Calling loginUser() should ask the data store for a user")
        XCTAssertNotNil(errorAccount, "loginUser() should return a error not nil")
        XCTAssertNil(userAccout, "loginUser() should return a nil user")
    }
    
}
