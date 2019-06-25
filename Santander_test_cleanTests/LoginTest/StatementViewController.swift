import XCTest

@testable import Santander_test_clean

class StatementViewController: XCTestCase {
    
    var viewController: StatementsViewController!
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
        viewController = (storyboard.instantiateViewController(withIdentifier: "statementsViewController") as! StatementsViewController)
    }
    
    func loadView()
    {
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }
    
    func testRequestStatements(){
        loadView()
        let worker = StatementsWorker()
        let presenter = StatementsPresenter()
        let userAccount = UserAccount()
        let expectation = self.expectation(description: "Scaling")
        worker.statements({ (statements) in
            presenter.getStantementList(statements: statements)
            presenter.dataUser(data: userAccount)
            expectation.fulfill()
        }) { (error) in
            
        }
        waitForExpectations(timeout: 5, handler: nil)

    }

}
