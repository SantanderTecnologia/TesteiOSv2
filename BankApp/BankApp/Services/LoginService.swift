//
//  services.swift
//  BankApp
//
//  Created by Joni Campos on 19/09/19.
//  Copyright © 2019 Joni Campos. All rights reserved.
//

import Foundation

class LoginService: LoginProtocol {
    
    //Faz a chamada para a API de login
    func login(_ login: String, password: String, completionHandler: @escaping (Login.Something.User?) -> Void) {
        
        var request = URLRequest(url: URL(string: "https://bank-app-test.herokuapp.com/api/login")!)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let bodyData = "user=\(login)&password=\(password)"
        request.httpBody = bodyData.data(using: .utf8)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                //verify response
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200{ //Verifica se a consulta deu certo
                        guard let data = data else {return}
                        do {
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                if let user = json["userAccount"] as? [String: Any] {
                                    let userReturn = try JSONSerialization.data(withJSONObject: user, options: [])
                                    let decoder = JSONDecoder()
                                    let retorno = try decoder.decode(Login.Something.User.self, from: userReturn)
                                    
                                    DispatchQueue.main.async {
                                        completionHandler(retorno)
                                    }
                                }
                            }
                        } catch let jsonErr {
                            print("Erro ao serializar o JSON", jsonErr)
                        }
                    }
                }
            }
        })
        
        task.resume()
    }
}



