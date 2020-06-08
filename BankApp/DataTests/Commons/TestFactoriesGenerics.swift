//
//  TestFactories+Extension.swift
//  DataTests
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

var dataInvalid: Data {
    return .init("Data Invaid".utf8)
}

var dataValid: Data {
    return .init("{\"user\":\"test_user\",\"password\":\"Test@1\"}".utf8)
}

var dataEmpty: Data {
    return .init()
}


func createResponseWith(statusCode: Int) -> HTTPURLResponse {
    return HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
}

var url: URL {
    return URL(string: "http://url-mock.com")!
}

var error: Error {
    NSError(domain: "error_any", code: -1, userInfo: [:])
}
