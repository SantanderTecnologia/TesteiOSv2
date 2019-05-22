//
//  Remote.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 08/04/19.
//  Copyright © 2019 Lucas Brandão Pereira. All rights reserved.
//

import Foundation


struct Remote {
    static func makeRequest<T: Decodable>(request: Request, completionHandler: @escaping (T?, _ errorMessage: String?) -> Void) {
        Network.request(request: request, completionHandler: { response in
            guard let data = response.data  else {
                completionHandler(nil, response.error?.localizedDescription)
                return
            }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                completionHandler(object, nil)
            } catch let error {
                print(error)
                completionHandler(nil, "Não foi possível obter dados do usuário")
            }
        })
    }
}
