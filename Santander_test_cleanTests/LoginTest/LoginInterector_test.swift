
import XCTest

@testable import Santander_test_clean
class LoginInterector_test: XCTestCase {
    
    var interactor: LoginInteractor!
    
    override func setUp()
    {
        super.setUp()
        setupLoginInteractor()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func setupLoginInteractor()
    {
        
        interactor = LoginInteractor()
    }

    func testWorkerRequest() {
        
        let worker = LoginWorker()
        let presenter = LoginPresenter()
        let user = "teste@gmail.com"
        let password = "Teste@1232"
        let expectation = self.expectation(description: "Scaling")
        let userAuthentication = DataUserAuthentication(user: user , password: password)
        worker.authenticatorLogin(from: userAuthentication, completion: { (response) in
            if let userAccount = response.userAccount {
                presenter.dataUserValid(data: userAccount)
            }
            expectation.fulfill()
        }) { (error) in
            
        }
        waitForExpectations(timeout: 5, handler: nil)
 }
    

}
