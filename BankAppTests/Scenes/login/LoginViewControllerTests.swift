@testable import BankApp
import XCTest

class LoginViewControllerTests: XCTestCase
{
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
        sut = storyboard.instantiateViewController(withIdentifier: "LoginController") as? LoginViewController
        XCTAssertNotNil(sut,"Instantiating LoginViewController")
    }
    
    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: - Test doubles
    
    class LoginBusinessLogicSpy: LoginBusinessLogic
    {
        // MARK: Method call expectations
        
        var loginButtonTappedCalled = false
        
        // MARK: Spied methods
        
        func createLogin(request: Login.CreateLogin.Request) {
            loginButtonTappedCalled = true
        }
    }
    
    class LoginRouterSpy: LoginRouter
    {
        // MARK: Method call expectations
        
        var loginRouterCalled = false
        var navigateToStatementCalled = false
        var passDataToStatementCalled = false
        
        // MARK: Spied methods
        
        override func routeToStatement(segue: UIStoryboardSegue?) {
            loginRouterCalled = true
        }
    }
    
    // MARK: - Tests
    
    func testShouldFailLoginWhenViewDidAppear()
    {
        // Given
        let loginBusinessLogicSpy = LoginBusinessLogicSpy()
        sut.interactor = loginBusinessLogicSpy
        loadView()
        
        // When
        sut.viewDidAppear(true)
        sut.loginTextField.text = ""
        sut.passwordTextField.text = ""
        sut.loginButtonTapped(UIButton())
        
        // Then
        XCTAssertFalse(loginBusinessLogicSpy.loginButtonTappedCalled, "Should not login once no data was typed")
    }
    
    func testShouldTryLoginWhenViewDidAppear()
    {
        // Given
        let loginBusinessLogicSpy = LoginBusinessLogicSpy()
        sut.interactor = loginBusinessLogicSpy
        loadView()
        
        // When
        sut.viewDidAppear(true)
        sut.loginTextField.text = "asdf"
        sut.passwordTextField.text = "asdf"
        sut.loginButtonTapped(UIButton())
        
        // Then
        XCTAssertTrue(loginBusinessLogicSpy.loginButtonTappedCalled, "Should login")
    }
    
    func testShouldRouteToSomewhereElse()
    {
        // Given
        let routerSpy = LoginRouterSpy()
        sut.router = routerSpy
        
        
        // When
        sut.displayUserAccountStatement(viewModel: Login.CreateLogin.ViewModel(userAccount: Seeds.UserInfo.loggedAccount, error: nil))
        // Then
        XCTAssert(routerSpy.loginRouterCalled,"Redirect to other view")
    }
    
    func testShouldNOTRouteToSomewhereElse()
    {
        // Given
        let routerSpy = LoginRouterSpy()
        sut.router = routerSpy
        
        // When
        sut.displayUserAccountStatement(viewModel: Login.CreateLogin.ViewModel(userAccount: nil, error: .CannotLogin("")))
        // Then
        XCTAssertFalse(routerSpy.loginRouterCalled,"Redirect to other view")
    }
    
    func testViewWithShadows()
    {
        let shadowColorBefore = sut.view.layer.shadowColor
        let shadowOpacityBefore = sut.view.layer.shadowOpacity
        let shadowOffsetBefore = sut.view.layer.shadowOffset
        
        sut.view.applyShadow()
        
        XCTAssertNotEqual(sut.view.layer.shadowColor, shadowColorBefore,"Different shadowColor")
        XCTAssertNotEqual(sut.view.layer.shadowOpacity, shadowOpacityBefore,"Different shadowOpacity")
        XCTAssertNotEqual(sut.view.layer.shadowOffset, shadowOffsetBefore,"Different shadowOffset")
    }
}
