//
//  ManageLoginRequestResponseTests.swift
//  BankAppTests
//
//  Created by Bruno Maciel on 1/17/21.
//

import XCTest
@testable import BankApp

class ManageLoginRequestResponseTests: XCTestCase {
    
    let interactor = LoginInteractor()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func test_manageLoginResponse_receivedErrorResponse() {
        // Mock da resposta com erro
        guard
            let fileURL = Bundle.main.url(forResource: "MockErrorLoginResponse.json", withExtension: nil),
            let jsonData = try? Data(contentsOf: fileURL)
            else {
                XCTAssertFalse(true)
                return }
        let errorResponse = try! JSONDecoder().decode(LoginResponseStruct.self, from: jsonData)
        
        
        interactor.userInfo = nil
        
        // Teste
        interactor.manageLoginResponse(errorResponse)
        
        XCTAssertNil(interactor.userInfo)
    }
    
    func test_manageLoginResponse_receivedUserResponse() {
        // Mock da resposta com informações do usuario
        guard
            let fileURL = Bundle.main.url(forResource: "MockUserLoginResponse.json", withExtension: nil),
            let jsonData = try? Data(contentsOf: fileURL)
            else {
                XCTAssertFalse(true)
                return }
        let userResponse = try! JSONDecoder().decode(LoginResponseStruct.self, from: jsonData)
        
        
        interactor.userInfo = nil
        
        // Teste
        interactor.manageLoginResponse(userResponse)
        XCTAssertNotNil(interactor.userInfo)
        XCTAssertEqual(interactor.userInfo?.userId, userResponse.userAccount.userId)
        XCTAssertEqual(interactor.userInfo?.name, userResponse.userAccount.name)
    }

}
