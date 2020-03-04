//
//  AccountInteractor.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright (c) 2020 bank. All rights reserved.

import UIKit

protocol AccountBusinessLogic {

    func statements()
}

protocol AccountDataStore {
    var statementsItems: [Statement] { get set }
}

class AccountInteractor: AccountBusinessLogic, AccountDataStore {

    var statementsItems: [Statement] = []
    var presenter: AccountPresentationLogic?
    var worker: AccountWorker?

    init(worker: AccountWorker = AccountWorker()) {
        self.worker = worker
    }

    func statements() {
        worker?.statements(success: { [weak self] (response) in
            self?.statementsItems = response.statementList
            self?.presenter?.showStatements()
        }, failure: { (error) in

        })
    }
}
