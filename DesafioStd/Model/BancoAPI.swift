//
//  BancoAPI.swift
//  DesafioStd
//
//  Created by bianca.dos.s.sobral on 17/07/19.
//  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginService {
    
    func login(userService: String, passwordService: String, completion:@escaping
        (Usuario) -> Void)
}

protocol Movimentacao {
    func transacoes ( userId: Int, completion: @escaping ([Transacao]) -> Void)
}

class Bancologin: LoginService {
    
    func login (userService: String, passwordService: String, completion: @escaping  (Usuario) -> Void) { // a variavel completion do tipo funcao 'escaping' vai (recebendo futuramente os dados do response) preencher o Usuario e nao retornar nada
        
        let endpoint =  "https://bank-app-test.herokuapp.com/api/login"
        let params: Parameters = [
            "user" : userService, // parametro recebe minha variavel userService<
            "password" : passwordService]
        
        AF.request(endpoint, method: .post, parameters:
            params).responseData { response in // "response" variavel para dar 'return'"
                
                let decoder = JSONDecoder()
                let model = try! decoder.decode(UsuarioResponse.self, from: response.data!)
                completion(model.usuario)
                
        }
    }
}

class BancoMovimentacao: Movimentacao {
    
    func transacoes (userId: Int, completion: @escaping ([Transacao]) -> Void){
        let endpoint = "https://bank-app-test.herokuapp.com/api/statements/\(userId)"
        
        AF.request(endpoint,method: .get).responseData.self { response in // criei variavel 'response'' pra receber o retorno dos dados do request
            
            let decoder = JSONDecoder() // criei constante para executar o metodo que vai 'decodar', ou ler e traduzir os dados do Json
            let model = try! decoder.decode(ListaDetransacoes.self, from: response.data!) // desempacotei os dados do request(data) e retornei no response; ou response, que é a variavel que criei para retorno', recebe data 'decodados'
            completion(model.transacao) //chamo a variavel completion e executo a funcao que vai 'decodar' os dados e preencher a minha struct transacao.
            
        }
        
    }
}






