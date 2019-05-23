//
//  MainTablePresenter.swift
//  BankApp
//
//  Created by Pedro Veloso on 20/05/19.
//  Copyright © 2019 pedrofveloso. All rights reserved.
//

import Foundation

class MainTablePresenter {
    private weak var view: MainTableViewDelegate?
    private var repository: MainTableRepositoryDelegate
    private var coordinator: MainTableCoordinatorDelegate
    private var statements: [StatementModel]?
    private var user: LoginModel? {
        return UserHelper.shared.current
    }
    
    init(coordinator: MainTableCoordinatorDelegate, repository: MainTableRepositoryDelegate) {
        self.coordinator = coordinator
        self.repository = repository
    }
}

extension MainTablePresenter: MainTablePresenterDelegate {
    var bankInfo: String {
        guard let bankAccount = user?.bankAccount, let agency = user?.agency else {
            return ""
        }
        return "\(bankAccount) / \(agency)"
    }
    
    var balanceInfo: String {
        guard let balance = user?.balance else { return "" }
        return balance.toCurrency ?? ""
    }
    
    var userName: String {
        return user?.name ?? ""
    }
    
    var numberOfRows: Int {
        return statements?.count ?? 0
    }
    
    func set(view: MainTableViewDelegate) {
        self.view = view
    }
    
    func statement(for index: Int) -> StatementModel? {
        return statements?[index]
    }
    
    func logout() {
        KeychainHelper.shared.clear()
        UserHelper.shared.clear()
        coordinator.logout()
    }
    
    func viewDidLoad() {
        guard let id = user?.id else { return }
        repository.fetch(id: id, success: { [weak self] statements in
            guard let self = self else { return }
            self.statements = statements
            self.view?.reloadData()
        }) { [weak self] error in
            self?.view?.showAlert(message: error.domain)
        }
    }
}
