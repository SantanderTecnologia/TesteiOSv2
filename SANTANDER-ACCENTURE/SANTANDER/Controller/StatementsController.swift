//
//  StatementsController.swift
//  SANTANDER
//
//  Created by Maíra Preto on 27/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//
import Foundation

protocol StatementsControllerProtocol: class {
    func loadList(completion: (Bool) -> Void)
    func didFinishRequest(array: [StatementList])
}

class StatementsController {
    
    var provider: StatementsProvider = StatementsProvider()
    weak var delegate: StatementsControllerProtocol?
    
    func loadList(completion: @escaping (Bool) -> Void) {
        provider.getDataFromHeroKu { [weak self] array in 
            if let arrayStatement = array {
                self?.delegate?.didFinishRequest(array: arrayStatement)
                completion(true)
            }
        }
        return
    }
}

