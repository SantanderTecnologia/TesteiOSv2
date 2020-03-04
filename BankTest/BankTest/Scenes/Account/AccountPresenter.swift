//
//  AccountPresenter.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright (c) 2020 bank. All rights reserved.

import UIKit

protocol AccountPresentationLogic {
    func showStatements()
}

class AccountPresenter: AccountPresentationLogic {
    weak var viewController: AccountDisplayLogic?

    func showStatements(){
        viewController?.updateStatements()
    }
}
