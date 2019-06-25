
import XCTest

@testable import Santander_test_clean

class LoginController_test: XCTestCase {
    
    var viewController: LoginViewController!
    var window: UIWindow!
    
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
    
    func setupLoginViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        viewController = (storyboard.instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController)
    }
    
    func loadView()
    {
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }
    
    
    func testActionButton() {
        loadView()
        viewController.actionCheckUser((Any).self)
    }
    
    func testCheckUserEmailPasswordIsValid() {
        loadView()
        let user = "felipe@gmail.com"
        let password = "Moura@212"
        viewController.interactor?.checkUser(user: user, password: password)
    }
    
    func testCheckUserCPFPasswordIsValid() {
        loadView()
        let user = "75843052028"
        let password = "Moura@212"
        viewController.interactor?.checkUser(user: user, password: password)
    }
    
    func testButtonAble() {
        loadView()
        let user = viewController.txfUser
        user?.text =  "felipe@gmail.com"
        let pass = viewController.txfPassword
        pass?.text  = "Moura@121"
    }
    
    func testButtonDisabled() {
        loadView()
        let user = viewController.txfUser
        user?.text =  "felipe@gmail"
        let pass = viewController.txfPassword
        pass?.text  = "Moura"
    }

}
