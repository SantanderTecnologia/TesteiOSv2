//
//  AccountDetailsViewControllerTests.swift
//  TCS_ChallengeTests
//
//  Created by Rafael Valer on 17/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import XCTest
@testable import TCS_Challenge

class AccountDetailsViewControllerTests: XCTestCase {

    // MARK: - Subject under test
    
    var sut: AccountDetailsViewController!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupAccountDetailsViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupAccountDetailsViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(identifier: AccountDetailsViewController.identifier) as? AccountDetailsViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: - Test doubles
    
    class AccountDetailsBusinessLogicSpy: AccountDetailsBusinessLogic {
        
        // MARK: - Method call expectations
        var fetchStatementsCalled = false
        var fetchAccountInfoCalled = false
        
        // MARK: - Spied methods
        func fetchStatements() {
            fetchStatementsCalled = true
        }
        
        func fetchAccountInfo() {
            fetchAccountInfoCalled = true
        }
    }
    
    class TableViewSpy: UITableView {
        
        // MARK: - Method call expectations
        var reloadDataCalled = false
        
        // MARK: - Spied methods
        override func reloadData() {
            reloadDataCalled = true
        }
    }
    
    class StatementTableHeaderViewSpy: StatementTableHeaderView {
        
        // MARK: - Method call expectations
        var updateWithViewModelCalled = false
        
        // MARK: - Spied methods
        override func update(withViewModel viewModel: AccountDetails.FetchAccountInfo.ViewModel) {
            updateWithViewModelCalled = true
        }
    }
    
    
    // MARK: - Tests
    
    func testShouldFetchStatementsWhenViewDidLoad() {
        // Given
        let accountDetailsBusinessLogicSpy = AccountDetailsBusinessLogicSpy()
        sut.interactor = accountDetailsBusinessLogicSpy
        loadView()
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssert(accountDetailsBusinessLogicSpy.fetchStatementsCalled, "Should fetch statements after view is loaded")
    }
    
    func testShouldFetchAccountInfoWhenViewDidLoad() {
        // Given
        let accountDetailsBusinessLogicSpy = AccountDetailsBusinessLogicSpy()
        sut.interactor = accountDetailsBusinessLogicSpy
        loadView()
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssert(accountDetailsBusinessLogicSpy.fetchAccountInfoCalled, "Should fetch user account info after view is loaded")
    }
    
    func testShouldDisplayFetchedStatements() {
        // Given
        let tableViewSpy = TableViewSpy()
        sut.tableView = tableViewSpy
        
        // When
        let displayedStatements = [AccountDetails
            .FetchStatements.ViewModel
            .DisplayedStatement(title: "Pagamento", desc: "Conta de Luz",
                                date: "20/10/2019", value: "R$120,00")]
        let viewModel = AccountDetails.FetchStatements.ViewModel(displayedStatements: displayedStatements)
        sut.displayFetchedStatements(viewModel: viewModel)
        
        // Then
        DispatchQueue.main.async {
            XCTAssert(tableViewSpy.reloadDataCalled, "Displaying fetched statements should reload the table view")
        }
    }
    
    func testShouldDisplayFetchedAccountInfo() {
        // Given
        loadView()
        let statementTableHeaderViewSpy = StatementTableHeaderViewSpy()
        sut.tableView.tableHeaderView = statementTableHeaderViewSpy
        
        // When
        let displayedAccountInfo = AccountDetails.FetchAccountInfo
            .ViewModel.DisplayedAccountInfo(name: "Rafael Vaz",
                                            account: "1239 / 12398",
                                            balance: "R$45.000,00")
        
        let viewModel = AccountDetails.FetchAccountInfo.ViewModel(displayedAccountInfo: displayedAccountInfo)
        sut.displayFetchedAccountInfo(viewModel: viewModel)
        
        XCTAssert(statementTableHeaderViewSpy.updateWithViewModelCalled, "Displaying fetched account info should update header view")
    }
    
    func testNumberOfRowsShouldEqualNumberOfStatementsToDisplay() {
        // Given
        loadView()
        let tableView = sut.tableView
        let testDisplayedStatements = [AccountDetails.FetchStatements.ViewModel
            .DisplayedStatement(title: "Pagamento", desc: "Conta de Luz",
                            date: "20/10/2019", value: "R$120,00")]
        sut.displayedStatements = testDisplayedStatements
        
        // When
        let numberOfRows = sut.tableView(tableView!, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, testDisplayedStatements.count, "The number of table view rows should be equal to the number of statements to display")
    }
    
    func testShouldConfigureTableViewCellToDisplayStatement() {
        // Given
        loadView()
        let tableView = sut.tableView
        let testDisplayedStatements = [AccountDetails.FetchStatements.ViewModel
            .DisplayedStatement(title: "Pagamento", desc: "Conta de Luz",
                        date: "20/10/2019", value: "R$120,00")]
        sut.displayedStatements = testDisplayedStatements
        sut.tableView.reloadData()
        
        // When
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView(tableView!, cellForRowAt: indexPath) as! StatementTableViewCell
        
        // Then
        XCTAssertEqual(cell.titleLabel.text, "Pagamento", "A properly configured table view cell should display the statement title")
        XCTAssertEqual(cell.descriptionLabel.text, "Conta de Luz", "A properly configured table view cell should display the statement description")
        XCTAssertEqual(cell.dateLabel.text, "20/10/2019", "A properly configured table view cell should display the statement date")
        XCTAssertEqual(cell.valueLabel.text, "R$120,00", "A properly configured table view cell should display the statement value")
    }
}
