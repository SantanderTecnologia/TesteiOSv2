//
//  TimelineWorker.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol TimelineWorkerLogic: AnyObject {
    func retrieveTransaction(model: TimelineModels.Request)
}

class TimelineWorker: TimelineWorkerLogic {
    func retrieveTransaction(model: TimelineModels.Request) {
        var parameters = RequestParameters()
        parameters.method = .get
        ApiManager.makeRequest(endpoint: .timelineList, parameters: parameters, success: model.success, failure: model.failure)
    }
}
