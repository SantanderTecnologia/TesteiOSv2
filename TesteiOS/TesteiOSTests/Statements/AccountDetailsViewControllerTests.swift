//
//  AccountDetailsViewControllerTests.swift
//  TesteIOSTests
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

@testable import TesteIOS
import XCTest

class AccountDetailsViewControllerTests: XCTestCase {
    
      var sut: AccountDetailsViewController!
      var window: UIWindow!
    
    
      override func setUp() {
          super.setUp()
          window = UIWindow()
          setupStatementsViewController()
      }
    
      override func tearDown() {
          window = nil
          super.tearDown()
      }
        
      func setupStatementsViewController() {
          let bundle = Bundle.main
          let storyboard = UIStoryboard(name: "Main", bundle: bundle)
          sut = storyboard.instantiateViewController(withIdentifier: "StatementsViewController") as? AccountDetailsViewController
      }
    
      func loadView() {
          window.addSubview(sut.view)
          RunLoop.current.run(until: Date())
      }
        
      class StatementsBusinessLogicSpy: StatementsBusinessLogic {
          var fecthStatementIsCalled = false
          var fecthHeaderIsCalled = false
          
          func fetchStatements() {
              fecthStatementIsCalled = true
          }
          
          func fetchHeader(data: AccountDetailsModel.Header.Request) {
              fecthHeaderIsCalled = true
          }
      }
          
      func testFetchHeader() {
          let spy = StatementsBusinessLogicSpy()
          sut.interactor = spy
          
          loadView()
          
          XCTAssertTrue(spy.fecthHeaderIsCalled)
      }
      
      func testFetchStatements() {
          let spy = StatementsBusinessLogicSpy()
          sut.interactor = spy
          
          loadView()
          
          XCTAssertTrue(spy.fecthStatementIsCalled)
      }
      
      func testSetupHeader() {
          // When
          loadView()
          let viewModel = AccountDetailsModel.Header.ViewModel(name: "Jose da Silva Teste",
                                                           account: "2050/012314564",
                                                           balance: "R$ 13,00")
          sut.displayHeaderData(viewModel: viewModel)
          
          XCTAssertEqual(sut.nameLabel.text, "Jose da Silva Teste")
          XCTAssertEqual(sut.accountLabel.text, "2050/012314564")
          XCTAssertEqual(sut.balanceLabel.text, "R$ 13,00")
      }
      
      func testSetupStatement() {
          loadView()
          let statement = Statement(title: "",
                                    desc: "",
                                    date: "",
                                    value: 0)
          
          let viewModel = AccountDetailsModel.Fetch.ViewModel(statementEntries: [statement])
          sut.displayData(viewModel: viewModel)
          
          XCTAssertEqual(sut.statementList.count, 1)
      }


}
