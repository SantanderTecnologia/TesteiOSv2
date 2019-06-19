//
//  AccountViewController.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 15/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation
import UIKit

protocol AccountDisplayLogic: AnyObject {
    func displayAlert(alert: UIAlertController)
    func dismissAlert()
    func displayUserAccount(userAccount: Account.UserAccountFormatted)
    func reloadData()
}

class AccountViewController: UIViewController, AccountDisplayLogic {
    let userAccountView = UIView()
    let usernameLabel = UILabel()
    let exitButton = UIButton()
    let contaLabel = UILabel()
    let accountLabel = UILabel()
    let saldoLabel = UILabel()
    let saldoValueLabel = UILabel()
    let recentesLabel = UILabel()
    let tableView = UITableView()
    
    var interactor: AccountBusinessLogic?
    var router: (NSObjectProtocol & AccountRoutingLogic & AccountDataPassing)?
    
    override func viewDidLoad() {
        self.addingViews()
        self.setupConstraints()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
        self.interactor?.fetchStatementList()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
        self.interactor?.fetchStatementList()
    }
    
    func setup() {
        let interactor = AccountInteractor()
        let presenter = AccountPresenter()
        let router = AccountRouter()
        self.interactor = interactor
        self.router = router
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
    }
    
    func displayAlert(alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
    
    func dismissAlert() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func displayUserAccount(userAccount: Account.UserAccountFormatted) {
        self.usernameLabel.text = userAccount.name
        self.accountLabel.text = userAccount.agencyBankAccount
        self.saldoValueLabel.text = userAccount.saldo
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    @objc func logout() {
        self.interactor?.logout()
    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.interactor?.getStatementList()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = (tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell)!
        cell.fillData(statement: (self.interactor?.getStatementList()?[indexPath.row])!)
        return cell
    }
}

extension AccountViewController: ViewCode {
    func addingViews() {
        self.view.backgroundColor = .white
        
        self.userAccountView.backgroundColor = K.Colors.mainBlue
        self.view.addSubview(self.userAccountView)
        
        self.usernameLabel.textColor = .white
        self.usernameLabel.font = UIFont(name: "Arial", size: 25)
        self.userAccountView.addSubview(self.usernameLabel)
        
        self.exitButton.setImage(UIImage(named: K.AccountScene.logoutImageName), for: .normal)
        self.exitButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        self.userAccountView.addSubview(self.exitButton)
        
        self.contaLabel.text = K.AccountScene.conta
        self.contaLabel.textColor = .white
        self.contaLabel.font = UIFont(name: "Arial", size: 12)
        self.userAccountView.addSubview(self.contaLabel)
        
        self.accountLabel.textColor = .white
        self.accountLabel.font = UIFont(name: "Arial", size: 25)
        self.userAccountView.addSubview(self.accountLabel)
        
        self.saldoLabel.text = K.AccountScene.saldo
        self.saldoLabel.textColor = .white
        self.saldoLabel.font = UIFont(name: "Arial", size: 12)
        self.userAccountView.addSubview(self.saldoLabel)
        
        self.saldoValueLabel.textColor = .white
        self.saldoValueLabel.font = UIFont(name: "Arial", size: 25)
        self.userAccountView.addSubview(self.saldoValueLabel)
        
        self.recentesLabel.textColor = K.Colors.darkGray
        self.recentesLabel.text = K.AccountScene.recentes
        self.recentesLabel.font = UIFont(name: "Arial", size: 17)
        self.view.addSubview(self.recentesLabel)
        
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.separatorStyle = .none
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = false
    }
    
    func setupConstraints() {
        self.userAccountView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(232)
        }
        
        self.usernameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalTo(self.exitButton.snp.leading).inset(8)
            make.height.equalTo(30)
        }
        
        self.exitButton.snp.makeConstraints { (make) in
            make.width.equalTo(27)
            make.height.equalTo(27)
            make.trailing.equalToSuperview().inset(13)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
        }
        
        self.contaLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.usernameLabel.snp.bottom).offset(28)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
        }
        
        self.accountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contaLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
        }
        
        self.saldoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.accountLabel.snp.bottom).offset(21)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
        }
        
        self.saldoValueLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.saldoLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.bottom.greaterThanOrEqualToSuperview().inset(18)
        }
        
        self.recentesLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userAccountView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
        }
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.recentesLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
