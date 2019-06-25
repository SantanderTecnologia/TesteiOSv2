
import XCTest

@testable import Santander_test_clean

class Santander_test_cleanTests: XCTestCase {
    
    func testIsValidEmail(){
        let email = "teste@gmail.com"
        XCTAssertTrue(email.isValidEmail)
    }
    
    func testInvalidEmail() {
        let email = "teste.com"
        XCTAssertFalse(email.isValidEmail)

    }
    
    func testInvalidCPF() {
        let cpf = "3982120239212"
        XCTAssertFalse(cpf.isValidCPF)
    }
    
    func testValidCPF() {
        let cpf = "75843052028"
        XCTAssertTrue(cpf.isValidCPF)
    }
    
    func testValidDateFormatter() {
        let date = "2019-12-02"
        XCTAssertEqual(date.toShortDate, "02/12/2019")
    }
    
    func testInvalidDateFormatter() {
        let date = "2019-30-02"
        XCTAssertEqual(date.toShortDate, "error")
    }
    
    func testValidPriceFormatter(){
        let price: Decimal = 350.20
        XCTAssertEqual(price.toCurrency, "R$ 350,20")
    }
    
    func testValidPassword() {
        let password = "Moura@121"
        XCTAssertTrue(password.isValidPassword)
    }
    func testInvalidPassword() {
        let password = "Moura121"
        XCTAssertFalse(password.isValidPassword)
    }
    
    func testIsCPF() {
        let cpf = "75843052028"
        XCTAssertTrue(cpf.isNumber)
    }
    func testNotCPF() {
        let email = "felipe@gmail.com"
        XCTAssertFalse(email.isNumber)
    }
    
    func testToAgencyFormatter() {
        let agency = "293292122"
        
        XCTAssertEqual(agency.toAgency, "29.329212-2")

    }

}
