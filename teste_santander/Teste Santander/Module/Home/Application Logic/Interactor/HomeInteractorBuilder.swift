//
//  HomeInteractorBuilder.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation


class HomeInteractorBuilder {
    
    static func make() -> HomeInteractor {
        
        let manager = HomeManager()
        
        let interactor = HomeInteractor(manager: manager)
        
        manager.output = interactor
        
        return interactor
    }
}
