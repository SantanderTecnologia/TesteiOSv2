//
//  requestLogin.swift
//  Desafio_Santander
//
//  Created by fernanda.pereira on 09/07/19.
//  Copyright © 2019 fernanda.pereira. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginService {
    func login(user: String, password: String, compleition:@escaping (Usuario) -> Void)
}

class requestLogin: LoginService {
    func login(user: String, password: String, compleition completion: @escaping (Usuario) -> Void) {
    
    let endpoint = "https://bank-app-test.herokuapp.com/api/login"
    let parametros: Parameters = ["user": "teste_user","password": "Test@1"]
    
    AF.request(endpoint, method: .post, parameters: parametros).responseData{ response in
        
        let decodificador = JSONDecoder()
        let modelo = try! decodificador.decode(UserResponse.self, from: response.data!)
        completion(modelo.user)
        
    
    
        }
    }
}

