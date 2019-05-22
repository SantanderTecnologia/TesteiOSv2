//
//  StatementsRouter.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 05/04/19.
//  Copyright (c) 2019 Lucas Brandão Pereira. All rights reserved.

import UIKit

@objc protocol StatementsRoutingLogic {
}

protocol StatementsDataPassing {
    var dataStore: StatementsDataStore? { get }
}

class StatementsRouter: NSObject, StatementsRoutingLogic, StatementsDataPassing {
    weak var viewController: StatementsViewController?
    var dataStore: StatementsDataStore?

}
