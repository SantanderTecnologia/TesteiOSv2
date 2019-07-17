//
//  TransacaoAPI.swift
//  TesteSantander
//
//  Created by bianca.butti.almeida on 14/07/19.
//  Copyright © 2019 bianca.butti.almeida. All rights reserved.
//

import Foundation
import Alamofire

protocol transacaoTeste {
    func transacao (userId: Int, completion:([(Transacao)]))
}

class TransacaoAPI {
    func transacao (userId: Int, completion:@escaping ([(Transacao)]) -> Void){
        let endpoint = "https://bank-app-test.herokuapp.com/api/statements/\(userId)"
        let parametros: Parameters = [
            "titulo" : "title"
        ]
        
        AF.request(endpoint, method: .get, parameters: parametros).responseData{
            response in
            let decoder = JSONDecoder()
            let model = try! decoder.decode(TransacaoResponse.self, from: response.data!)
            completion(model.listaTransacoes)
        }
    }
}
