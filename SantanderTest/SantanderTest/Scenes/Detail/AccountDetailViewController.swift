//
//  AccountDetailViewController.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 26/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol AccountDetailDisplayLogic: class {
    func displayData()
    func displayError(title: String, message: String)
    func displayLoading(_ isLoading: Bool)
    func displayLogin()
}

class AccountDetailViewController: ViewController {
    
    private var tableView: UITableView!
    
    //MARK: -
    //MARK: - SCENE PROPERTIES
    var interactor: AccountDetailBusinessLogic?
    var router: (NSObjectProtocol & AccountDetailRoutingLogic & AccountDetailDataPassing)?
    
    //MARK: -
    //MARK: - VIEW LIFE CYCLE
    override func prepareViews() {
        tableView = .init()
    }
    
    override func addViewHierarchy() {
        view.addSubview(tableView)
    }
    
    override func setupConstraints() {
        tableView.snp.makeConstraints { make in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide)
                make.left.right.bottom.equalToSuperview()
            } else {
                make.top.left.right.bottom.equalToSuperview()
            }
        }
    }
    
    override func configureViews() {
        view.backgroundColor = Constants.Palette.defaultColor
        tableView.backgroundColor = Constants.Palette.defaultColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.registerCell(StatementCell.self)
        configureAccountDetailScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.retrieveStaments()
    }
    
    //MARK: -
    //MARK: - CONFIGURE SCENE
    private func configureAccountDetailScene() {
        let viewController = self
        let interactor = AccountDetailInteractor()
        let presenter = AccountDetailPresenter()
        let router = AccountDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

//MARK: -
//MARK: - TABLEVIEW DELEGATE & DATA SOURCE
extension AccountDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        interactor?.header(tableView: tableView, section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        interactor?.height ?? 0.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        interactor?.numberOfRows(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = interactor?.cell(tableView: tableView, indexPath: indexPath) else { return UITableViewCell() }
        return cell
    }
}

//MARK: -
//MARK: - DISPLAY LOGIC
extension AccountDetailViewController: AccountDetailDisplayLogic {
    
    func displayLoading(_ isLoading: Bool) {
        if isLoading {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    func displayError(title: String, message: String) {
        presentAlert(with: title, and: message)
    }
    
    func displayData() {
        tableView.reloadData()
    }
    
    func displayLogin() {
        router?.routeToLogin()
    }
}
