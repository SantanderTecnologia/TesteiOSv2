//
//  AccountTableViewHeaderSpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOSv2

class AccountTableViewHeaderSpec : QuickSpec{
    override func spec() {
        describe("AccountTableViewHeaderSpec Spec") {
            var accountTableViewHeader : AccountTableViewHeader!
            context("when initilize"){
                var title : UILabel!
                beforeEach {
                    accountTableViewHeader = AccountTableViewHeader()
                    
                    title = accountTableViewHeader.title
                    
                }
                
                it("verify if labels aren't nil"){
                    expect(title).toNot(beNil())

                }
            }
        }
    }
}
