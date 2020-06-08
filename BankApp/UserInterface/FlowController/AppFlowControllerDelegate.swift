//
//  AppFlowControllerDelegate.swift
//  UserInterface
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation
import Domain
import Presenter

public protocol AppFlowControllerDelegate: AnyObject {
    
    func presentBalanceViewController(userAccount: UserAccountModel)
}
