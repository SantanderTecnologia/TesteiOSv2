//
//  PaymentsRouter.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

typealias PaymentsRouterProtocol = NSObject & PaymentsDataTransfer & PaymentsRoutingLogic

protocol PaymentsRoutingLogic {
    func routeBack()
}

protocol PaymentsDataTransfer {
    var dataStore: PaymentsDataStore? { get set}
}

class PaymentsRouter: NSObject, PaymentsDataTransfer {
    
    var dataStore: PaymentsDataStore?
    weak var viewController: UIViewController?
}

extension PaymentsRouter: PaymentsRoutingLogic {
    
    func routeBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
