//
//  HomePresenterBuilder.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class HomePresenterBuilder {
    
    static func make(wireframe: HomeWireframe) -> HomePresenter {
        let interactor = HomeInteractorBuilder.make()
        let loggedUserInteractor = LoggedUserInteractor()
        let presenter = HomePresenter(wireframe: wireframe, interactor: interactor, loggedInteractor: loggedUserInteractor)
        loggedUserInteractor.output = presenter
        interactor.output = presenter
        return presenter
    }
    
}
