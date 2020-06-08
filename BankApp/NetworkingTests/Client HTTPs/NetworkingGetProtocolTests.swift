//
//  NetworkingGetProtocolTests.swift
//  NetworkingTests
//
//  Created by Estaife Lima on 07/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
import Alamofire
import Data
@testable import Networking

class NetworkingGetProtocolTests: XCTestCase {

    func testGetMakeRequestWithUrlAndMethodCorect() throws {
        
        //Given
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolStub.self]
        let session = Session(configuration: configuration)
        let sut = AlamofireAdapter(session: session)
        memoryLeakCheckWith(instance: sut)
        
        
        //When/Then
        expectRequestWith(sut: sut) { (request) in
            XCTAssertEqual(url, request.url)
            XCTAssertEqual("GET", request.httpMethod)
            XCTAssertNil(request.httpBodyStream)
        }
    }
}

extension NetworkingGetProtocolTests {
    
    func expectRequestWith(sut: AlamofireAdapter, completion: @escaping (URLRequest) -> Void) {
        let expect = expectation(description: "waiting")
        sut.get(from: url) { _ in expect.fulfill() }
        var request: URLRequest!
        URLProtocolStub.observerRequest { request = $0 }
        wait(for: [expect], timeout: 1)
        completion(request)
    }

}
