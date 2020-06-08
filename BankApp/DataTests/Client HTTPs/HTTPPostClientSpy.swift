//
//  HTTPPostClientSpy.swift
//  DataTests
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation
import Data

final class HTTPPostClientSpy: HTTPPostClient {
    var url = [URL]()
    var data: Data?
    var completion: ((Result<Data?, HTTPError>) -> Void)?
    
    public func post(to url: URL, with data: Data?, completion: @escaping (Result<Data?, HTTPError>) -> Void) {
        self.url.append(url)
        self.data = data
        self.completion = completion
    }
    
    func completeWith(error: HTTPError) {
        completion?(.failure(.unknown))
    }
    
    func completeWith(data: Data) {
        completion?(.success(data))
    }
}
