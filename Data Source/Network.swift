//
//  Network.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 08/04/19.
//  Copyright © 2019 Lucas Brandão Pereira. All rights reserved.
//

import Foundation

struct Network {
    static func request(request: Request, completionHandler: @escaping (_ response: Response) -> Void) {
        let urlRequest = request.asURLRequest()! 
        
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let response = Response(data: data, response: response, error: error)
            
            if(error != nil){
              //  print("Erro uploading: \(error!.localizedDescription)")
            }
            
            if let data = data {
                print(String(data: data, encoding: String.Encoding.utf8) ?? "No response !!!!")
            } else {
               // print("Error: \(error?.localizedDescription) !!!!")
            }
            DispatchQueue.main.async() {
                completionHandler(response)
            }
        }
        task.resume()
    }
}
