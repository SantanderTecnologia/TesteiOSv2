//
//  StatementMapper.swift
//  Teste SantanderTests
//
//  Created by THIAGO on 11/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Quick
import Nimble

@testable import Teste_Santander

class StatementMapper: QuickSpec {
    
    override func spec() {
        var statementListModel: StatementListModel!
        
        beforeSuite {
            guard let statementListMock: StatementListModel = Loader.mock(file: "StatementList") else {
                fail("The JSON file does not exist")
                return
            }
            
            statementListModel = statementListMock
        }
        describe("StatementTests") {
            
            context("Testing mapper") {
                it("Is Type StatementEntity") {
                    let entitys = statementListModel.statementList.map({ StatementEntity.make(model: $0)})
                    expect(entitys.count).to(equal(9))
                }
                
                it("Is Type StatementItem") {
                    let entitys = statementListModel.statementList.map({ StatementEntity.make(model: $0)})
                    let items = entitys.map({ StatementItem.make(entity: $0) })
                    expect(items.count).to(equal(9))
                }
                
                it("Is Type StatementDisplay") {
                    let entitys = statementListModel.statementList.map({ StatementEntity.make(model: $0)})
                    let items = entitys.map({ StatementItem.make(entity: $0) })
                    let displays = items.map({ StatementDisplay.make(item: $0)})
                    expect(displays.count).to(equal(9))
                    
                    if let display = displays.first {
                        expect(display.value).to(equal("R$ -50,00"))
                        expect(display.desc).to(equal("Conta de luz"))
                        expect(display.type).to(equal("Pagamento"))
                        expect(display.date).to(equal("15/08/2018"))
                    }
                }
            }
        }
    }
}
