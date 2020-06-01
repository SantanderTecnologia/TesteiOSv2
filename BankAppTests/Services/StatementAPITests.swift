@testable import BankApp
import XCTest

class StatementAPITests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: StatementAPI!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupStatementAPI()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupStatementAPI()
    {
        sut = StatementAPI()
    }
    
    // MARK: - Test CRUD operations - Optional error
    
    func testStatementsFromServer()
    {
        var expectedStatements: [Statement]?
        let expect = expectation(description: "Wait for fetchStatement() to return")
        sut.fetchStatement { (statement) in
            expectedStatements = statement
            expect.fulfill()
        }
        waitForExpectations(timeout: 10.1)
        
        XCTAssertNotNil(expectedStatements, "fetchStatement() should return a list of statements")
    }
    
}

