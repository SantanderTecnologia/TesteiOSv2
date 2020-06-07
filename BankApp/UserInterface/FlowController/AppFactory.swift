//
//  AppFactory.swift
//  UserInterface
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit
import Domain

public protocol AppFactory: AnyObject {
    func makeLoginViewController() -> LoginViewController
    func makeBalanceViewController(userAccount: UserAccount) -> BalanceViewController
}
