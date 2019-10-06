//
//  ExtratoInteractorTests.swift
//  BankAppTests
//
//  Created by Victor Hugo Martins Lisboa on 02/10/19.
//  Copyright © 2019 Victor Lisboa. All rights reserved.
//

import XCTest
@testable import BankApp

class MockExtratoWorker: ExtratoWorker {
    
    var response: Extrato.Something.Response?
    
    override func doExtratoWork(completion: @escaping((Extrato.Something.Response) -> Void)) {
        
        let statements = [Extrato.Something.Statement(title: "Pagamento", desc: "Luz", date: "2019-09-17", value: -130.54), Extrato.Something.Statement(title: "Pagamento", desc: "Faculdade", date: "2019-09-10", value: 500.0)]
        response = Extrato.Something.Response(statementList: statements, error: nil)
        
        completion(response!)
    }
}

class ExtratoPresentationLogicSpy: ExtratoPresentationLogic {
    var isExtratoCalled = false
    
    func presentSomething(response: Extrato.Something.Response) {
        isExtratoCalled = true
    }
}

class ExtratoInteractorTests: XCTestCase {
    
    var sut: ExtratoInteractor?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ExtratoInteractor()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInteractor() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.let mockWorker = MockExtratoWorker()
        let mockWorker = MockExtratoWorker()
        let request = Extrato.Something.Request()
        let spy = ExtratoPresentationLogicSpy()
        
        sut?.worker = mockWorker
        sut?.presenter = spy
        sut?.doExtrato(request: request)
        
        XCTAssert(spy.isExtratoCalled)
                
        XCTAssertNotNil(mockWorker.response)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
