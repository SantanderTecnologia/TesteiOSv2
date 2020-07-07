//
//  PaymentsViewController.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

protocol PaymentsDisplayLogic: class {
    func displayUserInfo(_ viewModel: Payments.Info.ViewModel.UserAccount)
    func displayStatements(_ viewModel: Payments.Info.ViewModel.Payment)
    func displayError(_ errorMessage: String)
}

class PaymentsViewController: UIViewController {
    
    private lazy var logOutButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.addTarget(self, action: #selector(didTapLogOutButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var headerView: PaymentMainHeaderView = {
        return PaymentMainHeaderView(frame: .zero,
                                     logOutButton: logOutButton)
    }()
    
    private lazy var tableView: UITableView = {
        return UITableView(frame: .zero)
    }()
    
    private lazy var paymentsView: PaymentsView = {
        return PaymentsView(frame: .zero,
                            headerView: headerView,
                            tableView: tableView)
    }()
    
    private var interactor: PaymentsBusinessLogic?
    var router: PaymentsRouterProtocol?
    
    private var viewModel: Payments.Info.ViewModel.Payment?
    
    private var factory: PaymentsFactory?
    
    private var dataSource: DefaultTableViewOutput?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }
    
    override func loadView() {
        super.loadView()
        self.view = paymentsView
    }
    
    private func setup() {
        let viewController = self
        let interactor = PaymentsInteractor(viewController: viewController)
        let router = PaymentsRouter()
        router.dataStore = interactor
        router.viewController = viewController
        viewController.router = router
        viewController.interactor = interactor
    }
    
    private func fetch() {
        interactor?.fetchUserInfo(Payments.Request.UserInfo())
        interactor?.fetchStatements()
    }
}

extension PaymentsViewController {
    
    @objc
    private func didTapLogOutButton() {
        router?.routeBack()
    }

    private func setupDataSource() {
        guard let sections = factory?.buildSections() else { return }
        dataSource = DefaultTableViewOutput(sections: sections)
    }
    
    private func setupTableView() {
        guard let dataSource = dataSource else { return }
        tableView.assignProtocols(to: dataSource)
    }
    
    private func setupFactory() {
        guard let viewModel = viewModel else { return }
        factory = PaymentsFactory(viewModel: viewModel,
                                  tableView: tableView)
    }
    
    private func refreshList() {
        setupFactory()
        setupDataSource()
        setupTableView()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension PaymentsViewController: PaymentsDisplayLogic {
    
    func displayUserInfo(_ viewModel: Payments.Info.ViewModel.UserAccount) {
        headerView.setup(viewModel: viewModel)
    }
    
    func displayStatements(_ viewModel: Payments.Info.ViewModel.Payment) {
        self.viewModel = viewModel
        refreshList()
    }
    
    func displayError(_ errorMessage: String) {
        paymentsView.errorMessage = errorMessage
    }
}

