//
//  UsernameValidationTests.swift
//  BankAppTests
//
//  Created by Bruno Maciel on 1/16/21.
//

import XCTest
@testable import BankApp

class UsernameValidationTests: XCTestCase {
    
    let interactor = LoginInteractor()

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    // MARK: - Validation MUST FAIL
    
    func test_validateUsername_nilUsername() {
        let nilUsername: String? = nil
        
        XCTAssertThrowsError(try interactor.validateUsername(nilUsername)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.blankUsername)
        }
    }
    
    func test_validateUsername_emptyUsername() {
        let emptyUsername: String? = ""
        
        XCTAssertThrowsError(try interactor.validateUsername(emptyUsername)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.blankUsername)
        }
    }
    
    func test_validateUsername_onlySpacesUsername() {
        let onlySpacesUsername: String? = "    "
        
        XCTAssertThrowsError(try interactor.validateUsername(onlySpacesUsername)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.blankUsername)
        }
    }
    
    func test_validateUsername_invalidCPF() {
        let invalidCPF: String? = "12345678900"
        let invalidCPF2: String? = "11111111111"
        let invalidCPF3: String? = "165.401.980-19a"
        
        XCTAssertThrowsError(try interactor.validateUsername(invalidCPF)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidUsername)
        }
        
        XCTAssertThrowsError(try interactor.validateUsername(invalidCPF2)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidUsername)
        }
        
        XCTAssertThrowsError(try interactor.validateUsername(invalidCPF3)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidUsername)
        }
    }
    
    func test_validateUsername_invalidEmail() {
        let invalidEmail: String? = "a@e@fd.fd"
        let invalidEmail2: String? = "email@email.f"
        let invalidEmail3: String? = "em ail@email.com"
        let invalidEmail4: String? = "emailemail.com"
        
        XCTAssertThrowsError(try interactor.validateUsername(invalidEmail)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidUsername)
        }
        
        XCTAssertThrowsError(try interactor.validateUsername(invalidEmail2)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidUsername)
        }
        
        XCTAssertThrowsError(try interactor.validateUsername(invalidEmail3)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidUsername)
        }
        
        XCTAssertThrowsError(try interactor.validateUsername(invalidEmail4)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidUsername)
        }
    }
    
    
    
    // MARK: - Validation MUST SUCCEED
    
    func test_validateUsername_validCPF_comPontuacao() {
        let validCPF_comPontuacao: String? = "165.401.980-19"
        
        XCTAssertNoThrow(try interactor.validateUsername(validCPF_comPontuacao))
    }
    
    func test_validateUsername_validCPF_semPontuacao() {
        let validCPF_semPontuacao: String? = "16540198019"
        
        XCTAssertNoThrow(try interactor.validateUsername(validCPF_semPontuacao))
    }
    
    func test_validateUsername_validEmail() {
        let validEmail: String? = "email@email.com"
        let validEmail2: String? = "email@email.com.br"
        let validEmail3: String? = "asd@asd.asdf"
        
        XCTAssertNoThrow(try interactor.validateUsername(validEmail))
        XCTAssertNoThrow(try interactor.validateUsername(validEmail2))
        XCTAssertNoThrow(try interactor.validateUsername(validEmail3))
    }

}
