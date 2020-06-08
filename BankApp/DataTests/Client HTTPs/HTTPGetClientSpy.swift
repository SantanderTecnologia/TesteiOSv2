//
//  File.swift
//  DataTests
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation
import Data

class HTTPGetClientSpy: HTTPGetClient {
    var url = [URL]()
    var completion: ((Result<Data?, HTTPError>) -> Void)?
    
    public func get(from url: URL, completion: @escaping (Result<Data?, HTTPError>) -> Void) {
        self.url.append(url)
        self.completion = completion
    }
    
    func completeWith(error: HTTPError) {
        completion?(.failure(.unknown))
    }
    
    func completeWith(data: Data) {
        completion?(.success(data))
    }
}
