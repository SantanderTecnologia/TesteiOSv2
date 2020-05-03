//
//  StatementsControllerProtocolTest.swift
//  SANTANDER
//
//  Created by Maíra Preto on 20/04/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

class StatementsControllerProtocolTest: StatementsControllerProtocol {
    
    func didFinishRequest(array: [StatementList]) {
    }
    
    func loadList(completion: (Bool) -> Void) {
        completion(true)
    }
}
