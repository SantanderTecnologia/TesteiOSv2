//
//  AccontDetailTableViewCellSpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOSv2

class AccontDetailTableViewCellSpec : QuickSpec{
    override func spec() {
        describe("HeadViewSpec Spec") {
            var accontDetailTableViewCell : AccontDetailTableViewCell!
            context("when initilize"){
                var cellView : UIView!
                var title : UILabel!
                var descriptionAccount : UILabel!
                var dataLabel : UILabel!
                var  value : UILabel!
                
                beforeEach {
                    accontDetailTableViewCell = AccontDetailTableViewCell()
                    
                    cellView = accontDetailTableViewCell.cellView
                    title = accontDetailTableViewCell.title
                    descriptionAccount = accontDetailTableViewCell.descriptionAccount
                    dataLabel = accontDetailTableViewCell.dataLabel
                    value = accontDetailTableViewCell.value
                    
                    accontDetailTableViewCell.uploadCell(with: AccountStatementModel.init(statement: Statement.init(title: "teste123", desc: "teste", date: "2010-02-03", value: 12931923.923)) )
                    
                    
                }
                
                it("verify if labels aren't nil"){
                    expect(cellView).toNot(beNil())
                    expect(title).toNot(beNil())
                    expect(descriptionAccount).toNot(beNil())
                    expect(dataLabel).toNot(beNil())
                    expect(value).toNot(beNil())
                }
                it("has upload cell tittle"){
                    expect(accontDetailTableViewCell.title.text == "teste123").to(beTrue())
                }
            }
        }
    }
}
