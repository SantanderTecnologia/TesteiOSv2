//
//  StatementsPresenterTest.swift
//  Williamberg BankTests
//
//  Created by padrao on 01/06/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//
@testable import Williamberg_Bank
import UIKit
import XCTest

class StatementsPresenterTest: XCTestCase {

    var sut: StatementsPresenter!

    override func setUp()
    {
      super.setUp()
      sut = StatementsPresenter()
    }
    
    class ShowStatementDisplayLogicSpy: StatementsDisplayLogic
    {
        var displayUserAccountViewModel: Statements.LoadUserAccount.ViewModel!
        var displayStatementsViewModel: Statements.LoadStatements.ViewModel!
        
      // MARK: Spied methods
      func displayUserAccount(viewModel: Statements.LoadUserAccount.ViewModel) {
          displayUserAccountViewModel = viewModel
      }
      
      func displayStatements(viewModel: Statements.LoadStatements.ViewModel) {
          displayStatementsViewModel = viewModel
      }
      
      func displayErrorMessage(viewModel: Statements.LoadStatements.ViewModel) {
          displayStatementsViewModel = viewModel
      }
    }
    
    func testPresentUserAccount(){
        // Given
        let statementDisplayLogic = ShowStatementDisplayLogicSpy()
        sut.viewController = statementDisplayLogic
        
        // When
        let name = "Carlos"
        let bankAccount = "200"
        let agency = "001"
        let balance = 1000.0
        var userAccount: UserAccount?
        userAccount = UserAccount(userId: 0, name: name, bankAccount: bankAccount, agency: agency, balance: balance)
        
        let viewModel = Statements.LoadUserAccount.ViewModel(userAccount: userAccount)
        let response = Statements.LoadUserAccount.Response(userAccount: userAccount)
        sut.presentUserAccount(response: response)
        
        // Then
        let displayedUserAccountViewModel = statementDisplayLogic.displayUserAccountViewModel
        XCTAssertEqual(viewModel.name, displayedUserAccountViewModel?.name)
        XCTAssertEqual(viewModel.account, displayedUserAccountViewModel?.account)
        XCTAssertEqual(viewModel.balance, displayedUserAccountViewModel?.balance)
    }
    
    func testPresentStatements(){
        // Given
        let statementDisplayLogic = ShowStatementDisplayLogicSpy()
        sut.viewController = statementDisplayLogic
        let currencyFormatter: NumberFormatter = {
          let currencyFormatter = NumberFormatter()
          currencyFormatter.numberStyle = .currency
          return currencyFormatter
        }()
        
        // When
        let value = 10.0
        let statements = [Statement(title: "Pagamento", desc: "Conta de luz", date: "2020-06-15", value: value)]
        let displayedStatementsMock = [ Statements.LoadStatements.ViewModel.DisplayedStatement(title: "Pagamento", description: "Conta de luz", date: "15/06/2020", value: currencyFormatter.string(from: NSNumber(value: value)) ?? "-") ]
        
        let viewModel = Statements.LoadStatements.ViewModel(displayedStatements: displayedStatementsMock, errorMessage: nil, hideAdviseLabel: true)
        let response = Statements.LoadStatements.Response(statements: statements, errorMessage: nil)
        sut.presentFetchedStatements(response: response)
        
        // Then
        let displayStatementsViewModel = statementDisplayLogic.displayStatementsViewModel
        XCTAssertEqual(viewModel.displayedStatements[0].date, displayStatementsViewModel?.displayedStatements[0].date)
        XCTAssertEqual(viewModel.displayedStatements[0].description, displayStatementsViewModel?.displayedStatements[0].description)
        XCTAssertEqual(viewModel.displayedStatements[0].title, displayStatementsViewModel?.displayedStatements[0].title)
        XCTAssertEqual(viewModel.displayedStatements[0].value, displayStatementsViewModel?.displayedStatements[0].value)
        XCTAssertEqual(viewModel.errorMessage, displayStatementsViewModel?.errorMessage)
    }
    
    func testPresentStatementsWithInvalidValues(){
        // Given
        let statementDisplayLogic = ShowStatementDisplayLogicSpy()
        sut.viewController = statementDisplayLogic
        
        // When
        let statements = [Statement(title: "Pagamento", desc: nil, date: "2020-06-15", value: nil)]
        let displayedStatementsMock = [ Statements.LoadStatements.ViewModel.DisplayedStatement(title: "Pagamento", description: "-", date: "15/06/2020", value: "-") ]
        
        let viewModel = Statements.LoadStatements.ViewModel(displayedStatements: displayedStatementsMock, errorMessage: nil, hideAdviseLabel: true)
        let response = Statements.LoadStatements.Response(statements: statements, errorMessage: nil)
        sut.presentFetchedStatements(response: response)
        
        // Then
        let displayStatementsViewModel = statementDisplayLogic.displayStatementsViewModel
        XCTAssertEqual(viewModel.displayedStatements[0].date, displayStatementsViewModel?.displayedStatements[0].date)
        XCTAssertEqual(viewModel.displayedStatements[0].description, displayStatementsViewModel?.displayedStatements[0].description)
        XCTAssertEqual(viewModel.displayedStatements[0].title, displayStatementsViewModel?.displayedStatements[0].title)
        XCTAssertEqual(viewModel.displayedStatements[0].value, displayStatementsViewModel?.displayedStatements[0].value)
        XCTAssertEqual(viewModel.errorMessage, displayStatementsViewModel?.errorMessage)
    }
    
    func testDisplayErrorMessage(){
        // Given
        let statementDisplayLogic = ShowStatementDisplayLogicSpy()
        sut.viewController = statementDisplayLogic
        
        let errorMessage = "No data received"
        let viewModel = Statements.LoadStatements.ViewModel(displayedStatements: [], errorMessage: errorMessage, hideAdviseLabel: false)
        
        let response = Statements.LoadStatements.Response(statements: [], errorMessage: errorMessage)
        sut.presentFetchedStatements(response: response)
        
        let displayStatementsViewModel = statementDisplayLogic.displayStatementsViewModel
        XCTAssertEqual(viewModel.errorMessage, displayStatementsViewModel?.errorMessage)


        
    }
    
}
