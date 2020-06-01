@testable import BankApp
import XCTest

class LoginInteractorTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: LoginInteractor!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupLoginInteractor()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupLoginInteractor()
    {
        sut = LoginInteractor()
    }
    
    // MARK: - Test doubles
    
    class LoginPresentationLogicSpy: LoginPresentationLogic
    {
        // MARK: Method call expectations
        weak var viewController: LoginDisplayLogic?
        var presentCreateLoginCalled = false
        
        // MARK: Spied methods
        func presentCreateLogin(response: Login.CreateLogin.Response) {
            presentCreateLoginCalled = true
            var viewModel = Login.CreateLogin.ViewModel()
            viewModel.error = response.error
            viewModel.userAccount = response.userAccount
            viewController?.displayUserAccountStatement(viewModel: viewModel)
        }
    }
    
    class LoginWorkerSpy: UserWorker
    {
        // MARK: Method call expectations
        
        var loginUserCalled = false
        
        // MARK: Spied methods
        
        override init(loginStore: LoginStoreProtocol) {
            super.init(loginStore: loginStore)
            loginUserCalled = true
        }
        
        
    }
    
    class LoginAPISpy: LoginAPI
    {
        // MARK: Method call expectations
        
        var apiLoginCalled = false
        
        // MARK: Spied methods
        override func loginUser(_ user: User, completionHandler: @escaping (UserAccount?, UserStoreError?) -> Void) {
            apiLoginCalled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                if user.password.isEmpty || user.user.isEmpty {
                    completionHandler(nil, UserWorkerTests.loginError)
                } else {
                    completionHandler(UserWorkerTests.loggedAccount, nil)
                }
            }
        }
    }
    
    // MARK: - Tests
    
    func testFetchLoginShouldAskLoginWorkerToFetchLoginAndPresenterToFormatResult()
    {
        // Given
        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        sut.presenter = loginPresentationLogicSpy
        let apiSpy = LoginAPISpy()
        let loginWorkerSpy = LoginWorkerSpy(loginStore: apiSpy)
        sut.userWorker = loginWorkerSpy
        
        // When
        let request = Login.CreateLogin.Request(loginFromFields: Seeds.UserInfo.loginErrorFromFields)
        sut.createLogin(request: request)
        
        // Then
        XCTAssert(loginWorkerSpy.loginUserCalled, "FetchLogin() should ask UserWorker to login")
        XCTAssert(apiSpy.apiLoginCalled, "FetchLogin() should ask Api")
        XCTAssertFalse(loginPresentationLogicSpy.presentCreateLoginCalled, "FetchLogin() should not ask presenter to format login result")
    }
}
