//
//  TimelinePresenter.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol TimelinePresentationLogic: AnyObject {
    func presentTransactionList(model: TimelineModels.Response)
    func presentInitialState(model: TimelineModels.InitialState)
}

extension TimelinePresenter: TimelinePresentationLogic {
    func presentTransactionList(model: TimelineModels.Response) {
        viewController?.displayTransactionList(model: model)
    }
    
    func presentInitialState(model: TimelineModels.InitialState) {
        viewController?.displayInitialState(model: model)
    }
}

class TimelinePresenter: NSObject {

    private weak var viewController: TimelineDisplayLogic?
    
    init(viewController: TimelineDisplayLogic) {
        self.viewController = viewController
    }
}
