//
//  TesteiOSv2Tests.swift
//  TesteiOSv2Tests
//
//  Created by Foliveira on 03/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import XCTest
@testable import TesteiOSv2

class TesteiOSv2Tests: XCTestCase {
    
    func testUserValidation(){
        do{
        let field = CustomTextfield()
        field.text = "282.535.810-09"
        let answer = try field.validateByType(.user)
        XCTAssertEqual(answer, "282.535.810-09")
        } catch {
            
        }
        do{
        let field = CustomTextfield()
        field.text = "106.781.350-02"
        let answer = try field.validateByType(.user)
        XCTAssertEqual(answer, "106.781.350-02")
        } catch {
            
        }
        do{
        let field = CustomTextfield()
        field.text = "934.109.580-88"
        let answer = try field.validateByType(.user)
        XCTAssertEqual(answer, "934.109.580-88")
        } catch {
            
        }
        do{
        let field = CustomTextfield()
        field.text = "387.710.690-03"
        let answer = try field.validateByType(.user)
        XCTAssertEqual(answer, "387.710.690-03")
        } catch {
            
        }
        do{
        let field = CustomTextfield()
        field.text = "387710.690-03"
        let answer = try field.validateByType(.user)
        XCTAssertEqual(answer, "")
        } catch {
            
        }
        do{
        let field = CustomTextfield()
        field.text = "aa"
        let answer = try field.validateByType(.user)
        XCTAssertEqual(answer, "")
        } catch {
            
        }
        
    }
    
    func testPasswordValidation(){
        
        do{
        let field = CustomTextfield()
        field.text = "Test@1"
        let answer = try field.validateByType(.password)
        XCTAssertEqual(answer, "Test@1")
        } catch {
            
        }
        do{
        let field = CustomTextfield()
        field.text = "123456789"
        let answer = try field.validateByType(.password)
        XCTAssertEqual(answer, "")
        } catch {
            
        }
        do{
        let field = CustomTextfield()
        field.text = "TestandoAsenha@51"
        let answer = try field.validateByType(.password)
        XCTAssertEqual(answer, "TestandoAsenha@51")
        } catch {
            
        }
        
        
    }

}
