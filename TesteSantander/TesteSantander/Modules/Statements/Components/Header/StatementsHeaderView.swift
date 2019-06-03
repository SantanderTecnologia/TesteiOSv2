//
//  StatementsHeaderView.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 30/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import UIKit

class StatementsHeaderView: UIView {
    
    static let accountViewTitle = "Conta"
    static let balanceViewTitle = "Saldo"
    
    fileprivate var navigationView: NavigationView!
    fileprivate var accountView: InfoView!
    fileprivate var balanceView: InfoView!
    
    func setup(user: UserAccount, statementsLogoutViewController: StatementsLogoutViewController) {
        addNavigationView(name: user.name ?? Constants.Errors.UIStringError, statementsLogoutViewController: statementsLogoutViewController)
        addInfoViews(user: user)
    }
    
    fileprivate func addNavigationView(name: String, statementsLogoutViewController: StatementsLogoutViewController) {
        guard let navigationView = R.nib.navigationView.firstView(owner: nil) else { return }
        self.navigationView = navigationView
        addSubview(navigationView)
        navigationView.setup(name: name, statementsLogoutViewController: statementsLogoutViewController)
        navigationView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(49)
        }
    }
    
    fileprivate func addInfoViews(user: UserAccount) {
        guard let accountView = R.nib.infoView.firstView(owner: nil) else { return }
        self.accountView = accountView
        addSubview(accountView)
        accountView.setup(title: StatementsHeaderView.accountViewTitle, value: "\(user.bankAccount ?? Constants.Errors.UIStringError) / \(user.agency ?? Constants.Errors.UIStringError)")
        accountView.snp.makeConstraints { (make) in
            make.top.equalTo(navigationView.snp.bottom).offset(28)
            make.trailing.equalToSuperview().inset(18)
            make.leading.equalToSuperview().inset(18)
            make.height.equalTo(48)
        }
        
        guard let balanceView = R.nib.infoView.firstView(owner: nil) else { return }
        self.balanceView = balanceView
        addSubview(balanceView)
        balanceView.setup(title: StatementsHeaderView.balanceViewTitle, value: user.balance?.currencyFormat() ?? Constants.Errors.UIStringError)
        balanceView.snp.makeConstraints { (make) in
            make.top.equalTo(accountView.snp.bottom).offset(21)
            make.trailing.equalToSuperview().inset(18)
            make.leading.equalToSuperview().inset(18)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
}
