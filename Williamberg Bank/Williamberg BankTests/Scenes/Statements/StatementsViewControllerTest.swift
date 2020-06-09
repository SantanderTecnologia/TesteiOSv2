//
//  StatementsViewControllerTest.swift
//  Williamberg BankTests
//
//  Created by padrao on 07/06/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//
@testable import Williamberg_Bank
import UIKit
import XCTest

class StatementsViewControllerTest: XCTestCase {

    // MARK: - Subject under test
    
    var sut: StatementsViewController!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
      super.setUp()
      window = UIWindow()
      setupStatementsViewController()
    }
    
    override func tearDown()
    {
      window = nil
      super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupStatementsViewController()
    {
      let bundle = Bundle.main
      let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(identifier: "statementsViewController") as? StatementsViewController
    }
    
    func loadView()
    {
      window.addSubview(sut.view)
      RunLoop.current.run(until: Date())
    }
    
    func testLogoutAction(){
        // Given

        // When
        loadView()
        sut.logoutAction(UIButton())
        
        // Then
        XCTAssertFalse(sut.isBeingPresented)
    }
    
    func testTableViewCellForRow(){
        // Given
        let title = "Pagamento"
        let _description = "conta de luz"
        let date = "15/06/2019"
        let value = "-R$ 50,90"
        var displayedStatements = [Statements.LoadStatements.ViewModel.DisplayedStatement]()
        displayedStatements.append(Statements.LoadStatements.ViewModel.DisplayedStatement(title: title, description: _description, date: date, value: value))
        var cell: UITableViewCell?
        let indexPath = IndexPath(row: 0, section: 0)
        

        // When
        loadView()
        sut.displayedStatements = displayedStatements
        sut.statementsTableview.reloadData()
        cell = sut.tableView(sut.statementsTableview, cellForRowAt: indexPath)
        
        // Then
        XCTAssertNotNil(cell)
    }
    
    func testPreferredStatusBarStyle(){
        // Given
        let statusbarStyle = UIStatusBarStyle.lightContent
        

        // When
        loadView()
        sut.setNeedsStatusBarAppearanceUpdate()
        
        // Then
        XCTAssertEqual(sut.preferredStatusBarStyle, statusbarStyle)
    }
    
}
