@testable import BankApp
import XCTest

class LoginPresenterTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: LoginPresenter!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupLoginPresenter()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupLoginPresenter()
    {
        sut = LoginPresenter()
    }
    
    // MARK: - Test doubles
    
    class LoginDisplayLogicSpy: LoginDisplayLogic
    {
        // MARK: Method call expectations
        
        var displayUserAccountStatementCalled = false
        
        // MARK: Argument expectations
        
          var viewModel: Login.CreateLogin.ViewModel!
        
        // MARK: Spied methods
        func displayUserAccountStatement(viewModel: Login.CreateLogin.ViewModel) {
            displayUserAccountStatementCalled = true
            self.viewModel = viewModel
        }
    }
    
    // MARK: - Tests
    
    func testPresentFetchedOrdersShouldFormatFetchedOrdersForDisplay()
    {
        // Given
        let loginDisplayLogicSpy = LoginDisplayLogicSpy()
        sut.viewController = loginDisplayLogicSpy
        
        // When
        let loggedAccount = Seeds.UserInfo.loggedAccount
        
        let response = Login.CreateLogin.Response(userAccount: loggedAccount, error: nil)
        sut.presentCreateLogin(response: response)
        
        // Then
        XCTAssert(loginDisplayLogicSpy.displayUserAccountStatementCalled, "Presenting fetched user should ask view controller to display them")
    }
}
