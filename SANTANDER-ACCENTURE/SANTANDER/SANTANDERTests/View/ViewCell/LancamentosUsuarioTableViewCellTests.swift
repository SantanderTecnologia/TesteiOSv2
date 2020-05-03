//
//  LancamentosUsuarioTableViewCellTests.swift
//  SANTANDERTests
//
//  Created by Maíra Preto on 19/04/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import XCTest
@testable import SANTANDER

class LancamentosUsuarioTableViewCellTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_setCell(){
        let bundle = Bundle(for: LancamentosUsuarioTableViewCell.self)
        guard let cell = bundle.loadNibNamed("LancamentosUsuarioTableViewCell", owner: nil)?.first as? LancamentosUsuarioTableViewCell else {
            return XCTFail()
        }
        
        let statement = StatementList(title: "TED", desc: "Aluguel", date: "2020-04-20", value: 5025.00)
        
        cell.set(list: statement)
        
        XCTAssert(cell.tituloLabel.text == "TED")
        XCTAssert(cell.descricaoLabel.text == "Aluguel")
        XCTAssert(cell.dataLabel.text == "20/04/2020")
        XCTAssert(cell.valorLabel.text == "R$ 5025.00")
    }
}
