//
//  API.swift
//  BankTest
//
//  Created by Jaber Vieira Da Silva Shamali on 05/04/21.
//

import Foundation
import Alamofire

class API{
    
    func login(completionBlock: @escaping (_ success: Cliente) -> Void) {
        
        let url = "https://bank-app-test.herokuapp.com/api/login"
        var parameters:Parameters = [String : Any]()
        parameters["user"] = "test_user"
        parameters["password"] = "Test@1"

        AF.request(url,method: .post, parameters: parameters, encoding: URLEncoding.default,headers: nil)
            .responseJSON { (response) in
                switch response.result{
                case .success( _):
                    
                    do{
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(Cliente.self, from: response.data!)
                        
                        print(data)
                        completionBlock(data)
                    } catch {
                        print(error)
                    }
                        
                    
                case .failure(let error):
                    print("error: \(error)")
                
            }
        }
    }
    
    func getStatement(userId: String,completionBlock: @escaping (_ success: Lancamento) -> Void){
        
        let url = "https://bank-app-test.herokuapp.com/api/statements/1"

        AF.request(url,method: .get, parameters: nil, encoding: URLEncoding.default,headers: nil)
            .responseJSON { (response) in
                switch response.result{
                case .success( _):
                    
                    do{
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(Lancamento.self, from: response.data!)
                        
                        completionBlock(data)
                    } catch {
                        print(error)
                    }
                        
                    
                case .failure(let error):
                    print("error: \(error)")
                
            }
        }
        
    }
}
