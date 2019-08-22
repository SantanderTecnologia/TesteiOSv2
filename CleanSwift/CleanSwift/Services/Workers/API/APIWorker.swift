//
//  APIWorker.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Alamofire

class APIWorker {
    @discardableResult
    func createRequest<T:Decodable>(route: API, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T>)->Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder) { (response: DataResponse<T>) in
                completion(response.result)
        }
    }
}
