//
//  StatementListViewController.swift
//  TesteiOSv2
//
//  Created by Bruno on 09/11/18.
//  Copyright (c) 2018 Bruno Scheltzke. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StatementListDisplayLogic: class {
    func displayUserInfo(viewModel: StatementList.UserDetail.ViewModel)
    func displayStatements(viewModel: StatementList.Fetch.ViewModel)
    func displayError(viewModel: StatementList.Fetch.ErrorViewModel)
}

class StatementListViewController: UIViewController, StatementListDisplayLogic {
    var interactor: StatementListBusinessLogic?
    var router: (NSObjectProtocol & StatementListRoutingLogic & StatementListDataPassing)?
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    var statements: [StatementList.Fetch.ViewModel.StatementInfo] = []
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = StatementListInteractor()
        let presenter = StatementListPresenter()
        let router = StatementListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchUserInfo()
        fetchUserStatements()
    }
    
    func setupTableView() {
        tableView.register(type: StatementTableViewCell.self)
        tableView.dataSource = self
    }
    
    // MARK: Routing
    
    @IBAction func leaveButtonTapped(_ sender: Any) {
        leave()
    }
    
    func leave() {
        router?.leave()
    }
    
    // MARK: Fetch user info
    
    func fetchUserInfo() {
        interactor?.fetchUserInfo(request: StatementList.UserDetail.Request())
    }
    
    // MARK: Fetch user statements
    
    func fetchUserStatements() {
        interactor?.fetchUserStatements(request: StatementList.Fetch.Request())
    }
    
    // MARK: Display user info
    
    func displayUserInfo(viewModel: StatementList.UserDetail.ViewModel) {
        nameLabel.text = viewModel.name
        accountLabel.text = viewModel.account
        balanceLabel.text = viewModel.balance
    }
    
    // MARK: Display statements
    
    func displayStatements(viewModel: StatementList.Fetch.ViewModel) {
        DispatchQueue.main.async {
            self.statements = viewModel.statements
            self.tableView.reloadData()
        }
    }
    
    // MARK: Display error
    
    func displayError(viewModel: StatementList.Fetch.ErrorViewModel) {
        present(message: viewModel.message)
    }
}

// MARK: Table View

extension StatementListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statements.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StatementTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(with: statements[indexPath.row])
        return cell
    }
}
