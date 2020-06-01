@testable import BankApp
import XCTest

class StatementWorkerTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: StatementWorker!
    
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
        sut = StatementWorker(statementStore: StatementStoreSpy())
    }
    
    class StatementStoreSpy: StatementStoreProtocol
    {
        
        // MARK: Method call expectations
        
        var fetchStatementCalled = false
        
        // MARK: Spied methods
        
        func fetchStatement(completionHandler: @escaping ([Statement]) -> Void) {
            fetchStatementCalled = true
            completionHandler(Seeds.StatementInfo.statements)
        }
    }
    
    func testFetchLoginShouldReturnLogin()
    {
        // Given
        let statementsMemStoreSpy = sut.statementStore as! StatementStoreSpy
        
        // When
        let expect = expectation(description: "Wait for fetchLogin() to return")
        
        sut.fetchOrders { (statement) in
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.1)
        
        // Then
        XCTAssert(statementsMemStoreSpy.fetchStatementCalled, "Calling fetchStatement() should ask the data store for statenents")
    }
}

