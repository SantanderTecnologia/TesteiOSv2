//
//  AccountDetailsRouter.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation
import UIKit

@objc protocol AccountDetailsRoutingLogic {
    func navigateToLogin(source: AccountDetailsViewController)
}

protocol AccountDetailsDataPassing {
    var dataStore: AccountDetailsDataStore? { get set }
}

class AccountDetailsRouter: NSObject, AccountDetailsRoutingLogic, AccountDetailsDataPassing {
    
    weak var viewController: AccountDetailsViewController?
    var dataStore: AccountDetailsDataStore?
    
    // MARK: Navigation
    
    func navigateToLogin(source: AccountDetailsViewController) {
        source.navigationController?.popViewController(animated: true)
    }
}
