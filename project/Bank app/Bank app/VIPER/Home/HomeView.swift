//
//  HomeView.swift
//  Bank app
//
//  Created by mmalaqui on 19/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

class HomeView: BaseView<HomePresenterProtocol>, UITableViewDataSource, UITableViewDelegate {

    let screenName = "Home"
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var balanceValueLabel: UILabel!
    
    @IBOutlet weak var noResultLabel: UILabel!
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
        
        self.presenter?.homeViewDidLoad()
    }
    
    
    @IBAction func logoutActionButton(_ sender: Any) {
        self.presenter?.performLogout()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.presenter?.viewModel?.statementList?.count{
            if(count == 0){
                self.tableview.alpha = 0
                self.noResultLabel.alpha = 1
            }else{
                self.tableview.alpha = 1
                self.noResultLabel.alpha = 0
            }
            return count
        }
        
        self.tableview.alpha = 0
        self.noResultLabel.alpha = 1
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: HomeTableViewCell.self, for: indexPath)
        if let item = self.presenter?.viewModel?.statementList?[indexPath.row]{
            cell.setup(homeViewStatementModel: item)
        }
        
        return cell
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    deinit {
        //clean all references
        self.presenter?.cleanup()
    }
    
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension HomeView: BaseViewControllerRefresh {
    func refresh() {
        self.presenter?.homeViewDidLoad()
    }
    
    func i18N() {
        self.title = "Home"
        self.accountLabel.text = "Home.AccountLabel".localized
        self.balanceLabel.text = "Home.BalanceLabel".localized
        self.noResultLabel.text = "Home.NoResultLabel".localized
        self.noResultLabel.alpha = 0 
    }
    
    func initializeUI() {
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
        self.tableview.register(cellType: HomeTableViewCell.self)
        
        
    }
}
