//
//  DadosUsuarioTableViewCellTests.swift
//  SANTANDERTests
//
//  Created by Maíra Preto on 19/04/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import XCTest
@testable import SANTANDER

class DadosUsuarioTableViewCellTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_setUpCell(){
        let bundle = Bundle(for: DadosUsuarioTableViewCell.self)
        guard let cell = bundle.loadNibNamed("DadosUsuarioTableViewCell", owner: nil)?.first as? DadosUsuarioTableViewCell else {
            return XCTFail()
        }
        
        let userAccount = UserAccount(userID: 1, name: "Maira Acioli", bankAccount: "012345678-9", agency: "0415", balance: -898.34)
        
        cell.setupCell(value: userAccount)
        
        XCTAssert(cell.nomeLabel.text == "Maira Acioli")
        XCTAssert(cell.dadosContaLabel.text == "0415/012345678-9")
        XCTAssert(cell.saldoLabel.text == "R$ -898.34")
    }
}
