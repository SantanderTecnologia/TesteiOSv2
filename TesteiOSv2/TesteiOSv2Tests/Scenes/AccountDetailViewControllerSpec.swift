//
//  AccountDetailViewControllerSpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOSv2

class AccountDetailViewControllerSpec : QuickSpec{
    override func spec() {
        describe("AccountDetailViewControllerSpec Spec") {
            var accountDetailViewController : AccountDetailViewController!
            var interactor : AccountDetailInteractor!
            var presenter : AccountDetailPresenter!
            var router : AccountDetailRouter!
            
            
            context("when initilize, will do all VIP cicle"){

                var headView : HeadView!
                var tableViewHeader : AccountTableViewHeader!
                var tableView : UITableView!
                var updatedAccountMount : Bool!
                beforeEach {
                    accountDetailViewController = AccountDetailViewController(user: UserAccount(userId: 45, name: "teste", bankAccount: "teste", agency: "teste", balance: 234.342))
                
                    headView = accountDetailViewController.headView
                    tableViewHeader = accountDetailViewController.tableViewHeader
                    tableView = accountDetailViewController.tableView
                    
                    interactor = accountDetailViewController.interactor as? AccountDetailInteractor
                    presenter = interactor.presenter as? AccountDetailPresenter
                    router = accountDetailViewController.router as? AccountDetailRouter

                accountDetailViewController.updateAccountValue(value: "R$2,00")
                    
                    updatedAccountMount = (accountDetailViewController.headView.accontValueLabel.text == "R$2,00")
                    
                    
                    
                    
                }
                
                it("viewController not be nil"){
                    expect(accountDetailViewController).toNot(beNil())
                }
                it("interactor not be nil"){
                    expect(interactor).toNot(beNil())
                }
                it("presenter not be nil"){
                    expect(presenter).toNot(beNil())
                }
                it("router not be nil"){
                    expect(router).toNot(beNil())
                }
                it("verify if itens aren't nil"){
                    expect(headView).toNot(beNil())
                    expect(tableViewHeader).toNot(beNil())
                    expect(tableView).toNot(beNil())
                }
                it("check update mount"){
                    expect(updatedAccountMount).to(beTrue())
                }
            }
        }
    }
}
