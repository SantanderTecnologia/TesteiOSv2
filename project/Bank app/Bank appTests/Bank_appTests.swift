//
//  Bank_appTests.swift
//  Bank appTests
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import XCTest
@testable import Bank_app

class Bank_appTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //Keychain Tests
    func testSaveAndGetPasswordInKeychain() throws {
        let dummyPassword = "DUMMYPASSWORD"
        _ = KeychainUtils.shared.savePassword(password: dummyPassword)
        
        let passworkSaved = KeychainUtils.shared.getPassword()
        
        XCTAssertEqual(dummyPassword, passworkSaved, "password is not the same")
    }
    
    func testDeletePasswordInKeychain() throws {
        KeychainUtils.shared.deletePassword()
        
        let passworkSaved = KeychainUtils.shared.getPassword()
        
        XCTAssertEqual(nil, passworkSaved, "Password was not deleted")
    }
    
    func testSaveAndGetUsernameInKeychain() throws {
        let dummyUsername = "DUMMYUSERNAME"
        _ = KeychainUtils.shared.saveUsername(username: dummyUsername)
        
        let usernameSaved = KeychainUtils.shared.getUsername()
        
        XCTAssertEqual(dummyUsername, usernameSaved, "Username is not the same")
    }
    
    func testDeleteUsernameInKeychain() throws {
        KeychainUtils.shared.deleteUsername()
        
        let usernameSaved = KeychainUtils.shared.getUsername()
        
        XCTAssertEqual(nil, usernameSaved, "Username was not deleted")
    }
    
    //CDL User test
    func testPerformLogin() throws {
        let cdlUser = CDLUser()
        let username = "test_user"
        let password = "Test@1"
        
        cdlUser.performLogin(username: username, password: password, subscriber: ("Test", {(response :CDLResponse?) -> Void in
            XCTAssertNil(response, "response is nil")
            if let response = response {
                switch response {
                case .failure(let error):
                    XCTFail("response with error \(error)")
                    break
                case .success(let model):
                    if let model = model as? CDLUserModel {
                        if model.accountNumber == nil || model.id == nil || model.name == nil || model.balance == nil ||  model.agencyID == nil {
                             XCTFail("response model is empty")
                        }
                        break
                    }else{
                        XCTFail("response is not compatible with CDLUserModel")
                        break
                    }
                }
            }
        }))
    }
    
    func testStatementsList() throws {
        let cdlStatements = CDLStatements()
        let fakeUserID = 1
        
        cdlStatements.getStatements(subscriber: ("Test", {(response :CDLResponse?) -> Void in
            XCTAssertNil(response, "response is nil")
            
            if let response = response {
                switch response {
                case .failure(let error):
                    XCTFail("response with error \(error)")
                    break
                case .success(let model):
                    if let model = model as? CDLStatementsModel {
                        if let statementsList = model.statementList {
                            if(statementsList.count == 0){
                                XCTFail("statementsList os empty")
                            }else{
                                let statementItem = statementsList[0]
                                if(statementItem.date == nil || statementItem.desc == nil || statementItem.title == nil || statementItem.value == nil){
                                    XCTFail("response model is empty")
                                }
                            }
                        }else{
                            XCTFail("statementsList is nil")
                        }
                        
                        break
                    }else{
                        XCTFail("response is not compatible with CDLStatements")
                        break
                    }
                }
            }
            
        }), userID: fakeUserID)
        
    }


}
