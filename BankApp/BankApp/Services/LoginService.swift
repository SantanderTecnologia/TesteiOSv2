//
//  LoginService.swift
//  BankApp
//
//  Created by Marcus Titton on 19/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import Foundation

class LoginService: LoginProtocol {
    //Faz um MOCK para a requisição de login
    func mockLogin(_ login: String, password: String, completionHandler: @escaping (User?) -> Void) {
        let user = User.init(userId: 1, name: "Teste Mockado", bankAccount: "Banco Mockado", agency: "Agencia Mockada", balance: 200)
        completionHandler(user)
    }
    
    //Faz a chamada para a API de login
    func login(_ login: String, password: String, completionHandler: @escaping (User?) -> Void) {
    
        //Inicializa a rotina de request
        var request = URLRequest(url: URL(string: "https://bank-app-test.herokuapp.com/api/login")!)
        request.httpMethod = "POST" //Requisição por POST
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type") //Header
        
        //Monta o conteúdo do BODY (user e password)
        let bodyData = "user=\(login)&password=\(password)"
        request.httpBody = bodyData.data(using: .utf8)
        
        //Inicializa a sessão
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                //Verifica o response
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200{ //Verifica se a consulta deu certo
                        //Verifica se o data (retorno) tem conteudo
                        guard let data = data else {return}
                        do {
                            //Serializa o objeto para JSON
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                //Captura o conteudo de userAccount
                                if let user = json["userAccount"] as? [String: Any] {
                                    
                                    //Serializa o objeto para data
                                    let userReturn = try JSONSerialization.data(withJSONObject: user, options: [])
                                    let decoder = JSONDecoder()
                                    
                                    //Decodifica o retorno com base nos campos colocado no model
                                    let retorno = try decoder.decode(User.self, from: userReturn)
                                    
                                    //Retorna o conteudo
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
