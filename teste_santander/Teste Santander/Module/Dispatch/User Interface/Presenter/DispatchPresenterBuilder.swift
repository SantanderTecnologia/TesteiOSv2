//
//  DispatchPresenterBuilder.swift
//  Teste Santander
//
//  Created by THIAGO on 09/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class DispatchPresenterBuilder {
    
    static func make(wireframe: DispatchWireframe) -> DispatchPresenter {
        let interactor = LoggedUserInteractor()
        let presenter = DispatchPresenter(wireframe: wireframe, interactor: interactor)
        interactor.output = presenter
        return presenter
    }
}
