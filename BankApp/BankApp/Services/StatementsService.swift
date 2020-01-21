//
//  StatementsService.swift
//  BankApp
//
//  Created by Joni de Campos on 22/09/19.
//  Copyright © 2019 Joni Campos. All rights reserved.
//

import Foundation

class StatementsService: StatementsDataProtocol {
    
    //Faz a chamada para a API do extrato
    func getStatements(_ id: Int, completionHandler: @escaping ([Login.Something.StatementUser]) -> Void) {
        
        //monta o request com o url = endpoint e parametro id
        var request = URLRequest(url: URL(string: "https://bank-app-test.herokuapp.com/api/statements/\(id)")!)
        //tipo do request = get
        request.httpMethod = "GET"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        //criar uma URLSession
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                print(request)
                
                //Verifica o response
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200{ //retorno status code
                        
                        print("Entrou aqui")
                        guard let data = data else {return}
                        do {
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                if let statementList = json["statementList"] as? [[String: Any]] {
                                    let statementReturn = try JSONSerialization.data(withJSONObject: statementList, options: [])
                                    let decoder = JSONDecoder()
                                    let retorno = try decoder.decode([Login.Something.StatementUser].self, from: statementReturn)
                                    
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

