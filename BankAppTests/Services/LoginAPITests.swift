@testable import BankApp
import XCTest

class LoginAPITests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: LoginAPI!
    var testLogin: User!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupLoginAPI()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupLoginAPI()
    {
        sut = LoginAPI()
        
        testLogin = Seeds.UserInfo.user
    }
    
    // MARK: - Test CRUD operations - Optional error
    
    func testLoginWithError()
    {
        var userAccount: UserAccount?
        var error: UserStoreError?
         let expect = expectation(description: "Wait for loginUser() to return")
        sut.loginUser(Seeds.UserInfo.userError) { (userAc, userErr) in
            userAccount = userAc
            error = userErr
            expect.fulfill()
        }
        waitForExpectations(timeout: 10.1)
        
        XCTAssertNil(userAccount, "loginUser() should return a error")
        XCTAssertNotNil(error, "loginUser() should return a error")
    }
    
    func testValidUserLogin()
    {
        var userAccount: UserAccount?
        var error: UserStoreError?
        let expect = expectation(description: "Wait for loginUser() to return")
        sut.loginUser(Seeds.UserInfo.user) { (userAc, userErr) in
            userAccount = userAc
            error = userErr
            expect.fulfill()
        }
        waitForExpectations(timeout: 10.1)
        
        XCTAssertNotNil(userAccount, "loginUser() should return a error")
        XCTAssertNil(error, "loginUser() should return a error")
    }
}

