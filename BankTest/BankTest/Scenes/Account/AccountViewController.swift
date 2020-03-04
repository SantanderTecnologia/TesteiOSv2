//
//  AccountViewController.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright (c) 2020 bank. All rights reserved.

import UIKit

protocol AccountDisplayLogic: class {
    func showAccount(viewModel: Login.ViewModel)
    func updateStatements()
}

class AccountViewController: UIViewController, AccountDisplayLogic, LoginDataStore {
    var loginResponse: Login.Response?

    var interactor: (AccountBusinessLogic & AccountDataStore)?
    var router: AccountRouter?

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var branchAndAccountLabel: UILabel!
    @IBOutlet private var balanceLabel: UILabel!
    @IBOutlet private var tableView: UITableView!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        let viewController = self
        let interactor = AccountInteractor()
        let presenter = AccountPresenter()
        let router = AccountRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.loadStatements()
    }

    @IBAction private func logout() {
        router?.routeTologout()
    }

    private func loadStatements() {
        interactor?.statements()
    }

    private func setupView() {
        tableView.register(StatementTableViewCell.self)
        if let userAccount = loginResponse?.userAccount {
            showAccount(viewModel: Login.ViewModel(userAccount: userAccount))
        }
    }

    func updateStatements() {
        self.tableView.reloadData()
    }

    func showAccount(viewModel: Login.ViewModel) {
        nameLabel.text = viewModel.name
        branchAndAccountLabel.text = viewModel.branchAndAccount
        balanceLabel.text = viewModel.balance
    }
}

extension AccountViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.statementsItems.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StatementTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        if let statement = interactor?.statementsItems[indexPath.row] {
            let viewModel = Account.ViewModel(statement: statement)
            cell.set(viewModel: viewModel)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Localizable.Recent.localize()
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.font = UIFont.systemFont(ofSize: 18)
            header.textLabel?.textColor = .darkGray
            header.tintColor = tableView.backgroundColor
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
}

extension AccountViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
