//
//  StatementUserViewController.swift
//  BankApp
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import UIKit

protocol StatementUserDisplayLogic: class {
    func displayStatement(_ viewModel: StatementUser.FetchStatement.ViewModel)
}

class StatementUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StatementUserDisplayLogic {
    
    // MARK: @IBOutlets
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBankData: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    var interactor: StatementUserBusinessLogic?
    var router: (NSObjectProtocol & StatementUserRoutingLogic & StatementUserDataPassing)?
    var statements: [Statement] = []
    
    
    // MARK: Object lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: Methods
    
    func setup() {
        let viewController = self
        let interactor = StatementUserInteractor()
        let presenter = StatementUserPresenter()
        let router = StatementUserRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let user = router?.dataStore.user {
            lblName.text = user.name
            lblBankData.text = "\(user.bankAccount) / \(user.agency)"
            lblBalance.text = user.balance.formattedAsCurrency()
        }
        fetchStatement()
    }
    
    func fetchStatement() {
        let request = StatementUser.FetchStatement.Request(userId: router!.dataStore!.user.userId)
        interactor?.fecthStatement(request)
    }
    
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let statement = statements[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatementUserCell", for: indexPath) as! StatementUserCell
        cell.lblDesc.text = statement.desc
        cell.lblDate.text = statement.date
        cell.lblTitle.text = statement.title
        cell.lblValue.text = statement.value.formattedAsCurrency()
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "StatementHeader")
        return header
    }
    
    
    // MARK: StatementUserDisplayLogic
    
    func displayStatement(_ viewModel: StatementUser.FetchStatement.ViewModel) {
        statements = viewModel.statements
        tableView.reloadData()
    }
}
