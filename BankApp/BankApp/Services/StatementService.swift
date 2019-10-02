//
//  StatementService.swift
//  BankApp
//
//  Created by Marcus Titton on 20/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import Foundation

class StatementService: StatementDataProtocol {
    func mockStatements(_ id: Int, completionHandler: @escaping ([StatementUser]) -> Void) {
        let statement = StatementUser.init(title: "Pagamento", desc: "Descrição", date: "26/09/2019", value: 123)
        completionHandler([statement])
    }
    
    
    //Faz a chamada para a API de captura de extrato
    func getStatements(_ id: Int, completionHandler: @escaping ([StatementUser]) -> Void) {
        
        //Inicializa a rotina de request
        var request = URLRequest(url: URL(string: "https://bank-app-test.herokuapp.com/api/statements/\(id)")!)
        request.httpMethod = "GET" //API por GET
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type") //Header
  
        //Inicia sessão
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                //Verifica o response
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 { //Verifica se a consulta deu certo
                        
                        //Verifica se o data (retorno) tem conteudo
                        guard let data = data else {return}
                        do {
                            //Serializa o objeto para JSON
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                //Captura o conteudo de statementList
                                if let statementList = json["statementList"] as? [[String: Any]] {
                                    
                                    //Serializa o objeto para data
                                    let statementReturn = try JSONSerialization.data(withJSONObject: statementList, options: [])
                                    let decoder = JSONDecoder()
                                    
                                    //Decodifica o retorno com base nos campos colocado no model
                                    let retorno = try decoder.decode([StatementUser].self, from: statementReturn)

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
        
        //Executa a consulta
        task.resume()
    }
}
