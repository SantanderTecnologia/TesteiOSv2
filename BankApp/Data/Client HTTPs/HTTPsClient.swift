//
//  HTTPPostClient.swift
//  Data
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public protocol HTTPPostClient {
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data?, HTTPError>) -> Void)
}

public protocol HTTPGetClient {
    func get(from url: URL, completion: @escaping (Result<Data?, HTTPError>) -> Void)
}
