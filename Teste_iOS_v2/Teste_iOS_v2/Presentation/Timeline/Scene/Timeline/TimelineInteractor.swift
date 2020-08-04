//
//  TimelineInteractor.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol TimelineBusinessLogic: AnyObject {
    func getTransactions()
    func setupInitialState()
}

extension TimelineInteractor: TimelineBusinessLogic {
    func getTransactions() {
        worker?.retrieveTransaction(model: .init(success: success, failure: failure))
    }
    
    func setupInitialState() {
        presenter?.presentInitialState(model: .init(userInformations: userInformations))
    }
}

class TimelineInteractor {
    
    private var presenter: TimelinePresentationLogic?
    private var worker: TimelineWorkerLogic?
    private var userInformations: UserAccount?
    
    init(presenter: TimelinePresentationLogic, worker: TimelineWorkerLogic, userInformations: UserAccount?) {
        self.presenter = presenter
        self.worker = worker
        self.userInformations = userInformations
    }
    
    private lazy var success: GenericResponse = { [weak self] data in
        guard let self = self else { return }
        do {
            let response = try JSONDecoder().decode(TimelineResponse.self, from: data)
            self.presenter?.presentTransactionList(model: .init(timelineList: response.list))
        } catch {
            print(error)
        }
    }
    
    private lazy var failure: EmptyClosure = { }
}
