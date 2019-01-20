//
//  BankHistoryController.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 24/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation
import UIKit

protocol BankHistoryDisplayLogic: class {
    
    func requestElements()
    func displayData(_ statementList: [Statement])
    func showError(_ alertController: UIAlertController)
    func setupStatusBar(statusBarStyle: UIStatusBarStyle, backgroudColor: UIColor)
}

class BankHistoryController: UITableViewController, BankHistoryDisplayLogic {
    
    var interactor: BankHistoryInteractionLogic?
    var router: (NSObjectProtocol & BankHistoryRouterLogic & BankHistoryDataPassing)?
    
    private var statementList: [Statement] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.configureStatusBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requestElements()
    }
    
    private func setup() {
        let viewController = self
        let interactor = BankHistoryInteractor()
        let presenter = BankHistoryPresenter()
        let router = BankHistoryRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func displayData(_ statementList: [Statement]) {
        self.statementList = statementList
        self.tableView.reloadData()
        
        guard let userAccountData = router?.dataStore else { return }
        guard let headerView = tableView.tableHeaderView as? BankHistoryHeaderView else { return }
        headerView.configure(userAccountData)
    }
    
    func requestElements() {
        guard let userAccount = router?.dataStore?.userAccount else { return }
        interactor?.getStatementList(by: userAccount)
    }
    
    func showError(_ alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setupStatusBar(statusBarStyle: UIStatusBarStyle, backgroudColor: UIColor) {
        self.setStatusBarStyle(statusBarStyle, backgroundColor: backgroudColor)
    }
    
    @IBAction func actionLogOut(_ sender: Any) {
        performSegue(withIdentifier: "unwindToIntroController", sender: nil)
        interactor?.clearAutoLogin()
    }
}

extension BankHistoryController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return statementList.count > 0 ? 1 : 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statementList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! BankHistoryTableViewCell
        cell.display(statementList[indexPath.row])
        return cell
    }
}
