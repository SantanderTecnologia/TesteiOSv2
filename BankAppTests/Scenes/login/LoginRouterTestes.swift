@testable import BankApp
import XCTest

class LoginRouterTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: LoginRouter!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupLoginRouter()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupLoginRouter()
    {
        sut = LoginRouter()
    }
    
    // MARK: - Test doubles
    
    class LoginDataStoreSPY: LoginDataStore
    {
        var updatetdUserAccout = false
        var userAccount: UserAccount? {
            didSet {
                updatetdUserAccout = true
            }
        }
    }
    
    // MARK: - Tests
    
    func testPresentFetchedOrdersShouldFormatFetchedOrdersForDisplay()
    {
        // Given
        let spy = LoginDataStoreSPY()
        spy.userAccount = Seeds.UserInfo.loggedAccount
        sut.dataStore = spy
        // When        
        sut.routeToStatement(segue: nil)
        
        // Then
        XCTAssertNotNil(spy.userAccount, "Presenting fetched user should ask view controller to display them")
        XCTAssert(spy.updatetdUserAccout, "Presenting fetched user should ask view controller to display them")
    }
}
