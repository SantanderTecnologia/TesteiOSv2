//
//  ConexaoAPI.swift
//  DesafioSantander
//
//  Created by daianne.gomes.aguiar on 05/07/19.
//  Copyright © 2019 daianne.gomes.aguiar. All rights reserved.
//

import Foundation
import Alamofire


protocol LoginService {
    func login(user: String, password: String, completion: @escaping (Usuario) -> Void)
    func conectMovimentacao(userId: Int, completion: @escaping ([Movimentacao]) -> Void )
}

class ConexaoAPI : LoginService {

    func login(user: String, password: String, completion: @escaping (Usuario) -> Void) {
        let endpoint = "https://bank-app-test.herokuapp.com/api/login"
        let params: Parameters = [
            "user": user,
            "password": password
            
        ]
    
        AF.request(endpoint, method: .post, parameters: params).responseData { response in
            
            let decoder = JSONDecoder()
            let model = try! decoder.decode(UsuarioResponse.self, from: response.data!)
            completion(model.usuario)
            
        }
    }
    
    func conectMovimentacao(userId: Int, completion: @escaping ([Movimentacao]) -> Void ) {
        let endpoint = "https://bank-app-test.herokuapp.com/api/statements/\(userId)"
        
        AF.request(endpoint, method: .get).responseData { response in
            let decoder = JSONDecoder()
            let movimentacoes =  try! decoder.decode(Compomentes.self, from: response.data!)
            completion(movimentacoes.movimentacao)
        }
       
    }
}
