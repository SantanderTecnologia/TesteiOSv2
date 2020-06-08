//
//  NetworkingPostProtocolTests.swift
//  NetworkingTests
//
//  Created by Estaife Lima on 31/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
import Alamofire
import Data
@testable import Networking

class NetworkingPostProtocolTests: XCTestCase {

    func testPostMakeRequestWithUrlAndMethodCorect() throws {
        
        //Given
        let sut = createSut()
        
        //When/Then
        expectRequestWith(sut: sut, data: dataValid) { (request) in
            XCTAssertEqual(url, request.url)
            XCTAssertEqual("POST", request.httpMethod)
            XCTAssertNotNil(request.httpBodyStream)
        }
    }
    
    func testPostMakeRequestRequestWhenDataHasBeenNil() throws {
        
        //Given
        let sut = createSut()
        
        //When/Then
        expectRequestWith(sut: sut, data: nil) { (request) in
            XCTAssertNil(request.httpBodyStream)
        }
    }
    
    func testPostMakeRequestToCompleteWithError() throws {
        expectResultWith(resultExpected: .failure(.unknown), andWith: (data: nil, response: nil, error: error))
    }
    
    func testPostMakeRequestToCompleteWithDataAndResponse200() throws {
        expectResultWith(resultExpected: .success(dataValid), andWith: (data: dataValid, response: createResponseWith(statusCode: 200), error: nil))
    }
    
    func testPostMakeRequestToCompleteWithoutDataAndResponse204() throws {
        expectResultWith(resultExpected: .success(nil), andWith: (data: dataValid, response: createResponseWith(statusCode: 204), error: nil))
        expectResultWith(resultExpected: .success(nil), andWith: (data: dataEmpty, response: createResponseWith(statusCode: 204), error: nil))
        expectResultWith(resultExpected: .success(nil), andWith: (data: nil, response: createResponseWith(statusCode: 204), error: nil))
    }
    
    func testPostMakeRequestToCompleteWithErrorAndResponseClass300StatusCode() throws {
        expectResultWith(resultExpected: .failure(.noConnectivity), andWith: (data: dataValid, response: createResponseWith(statusCode: 300), error: nil))
        expectResultWith(resultExpected: .failure(.noConnectivity), andWith: (data: dataValid, response: createResponseWith(statusCode: 399), error: nil))
    }
    
    func testPostMakeRequestToCompleteWithErrorAndResponseClass400StatusCode() throws {
        expectResultWith(resultExpected: .failure(.unauthorized), andWith: (data: dataInvalid, response: createResponseWith(statusCode: 401), error: nil))
        expectResultWith(resultExpected: .failure(.forbidden), andWith: (data: dataInvalid, response: createResponseWith(statusCode: 403), error: nil))
        expectResultWith(resultExpected: .failure(.notFound), andWith: (data: dataInvalid, response: createResponseWith(statusCode: 404), error: nil))
        expectResultWith(resultExpected: .failure(.invalidRequest), andWith: (data: dataInvalid, response: createResponseWith(statusCode: 499), error: nil))
    }
    
    func testPostMakeRequestToCompleteWithErrorAndResponseClass500StatusCode() throws {
        expectResultWith(resultExpected: .failure(.internalServer), andWith: (data: dataInvalid, response: createResponseWith(statusCode: 500), error: nil))
        expectResultWith(resultExpected: .failure(.internalServer), andWith: (data: dataInvalid, response: createResponseWith(statusCode: 550), error: nil))
        expectResultWith(resultExpected: .failure(.internalServer), andWith: (data: dataInvalid, response: createResponseWith(statusCode: 599), error: nil))
    }
    
    func testPostMakeRequestToCompleteWithAllResponsesInvalid() throws {
        expectResultWith(resultExpected: .failure(.unknown), andWith: (data: dataValid, response: nil, error: error))
        expectResultWith(resultExpected: .failure(.unknown), andWith: (data: nil, response: nil, error: error))
        expectResultWith(resultExpected: .failure(.unknown), andWith: (data: nil, response: nil, error: nil))
        expectResultWith(resultExpected: .failure(.unknown), andWith: (data: nil, response: createResponseWith(statusCode: 200), error: nil))
        expectResultWith(resultExpected: .failure(.unknown), andWith: (data: nil, response: createResponseWith(statusCode: 200), error: error))
        expectResultWith(resultExpected: .failure(.unknown), andWith: (data: dataValid, response: nil, error: nil))
    }
}

extension NetworkingPostProtocolTests {
    
    func createSut(file: StaticString = #file, line: UInt = #line) -> AlamofireAdapter {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolStub.self]
        let session = Session(configuration: configuration)
        let sut = AlamofireAdapter(session: session)
        memoryLeakCheckWith(instance: sut, file: file, line: line)
        return sut
    }
    
    func expectRequestWith(sut: AlamofireAdapter, data: Data?, completion: @escaping (URLRequest) -> Void) {
        let expect = expectation(description: "waiting")
        sut.post(to: url, with: data) { _ in expect.fulfill() }
        var request: URLRequest!
        URLProtocolStub.observerRequest { request = $0 }
        wait(for: [expect], timeout: 1)
        completion(request)
    }
    
    func expectResultWith(resultExpected: (Result<Data?, HTTPError>), andWith stub: (data: Data?, response: HTTPURLResponse?, error: Error?), file: StaticString = #file, line: UInt = #line) {
        
        //Given
        let sut = createSut()
        
        //Then
        let expect = expectation(description: "waiting")
        sut.post(to: url, with: nil) { resultReceived in
            switch (resultExpected, resultReceived) {
            case (.success(let dataExpected), .success(let dataReceived)): XCTAssertEqual(dataExpected, dataReceived, file: file, line: line)
            case (.failure(let errorExpected), .failure(let errorReceived)): XCTAssertEqual(errorExpected, errorReceived, file: file, line: line)
            default: XCTFail("Received \(resultReceived) this \(resultExpected) instead", file: file, line: line)
            }
            expect.fulfill()
        }
    
        //When
        URLProtocolStub.applySimulateWith(data: stub.data, response: stub.response, error: stub.error)
        wait(for: [expect], timeout: 1)
    }
}
