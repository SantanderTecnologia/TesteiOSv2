//
//  HeadViewSpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOSv2

class HeadViewSpec : QuickSpec{
    override func spec() {
        describe("HeadViewSpec Spec") {
            var headView : HeadView!
            context("when initilize"){
                var userName : UILabel!
                var logoutButton : UIButton!
                var accontLabel : UILabel!
                var accontNumberLabel : UILabel!
                var  balanceLabel : UILabel!
                var  accontValueLabel : UILabel!
                
                beforeEach {
                    headView = HeadView()
                    
                    userName = headView.userName
                    logoutButton = headView.logoutButton
                    accontLabel = headView.accontLabel
                    accontNumberLabel = headView.accontNumberLabel
                    balanceLabel = headView.balanceLabel
                    accontValueLabel = headView.accontValueLabel
                    
                    headView.pressedAction(sender: logoutButton.self)
                }
                
                it("verify if labels aren't nil"){
                    expect(userName).toNot(beNil())
                    expect(logoutButton).toNot(beNil())
                    expect(accontLabel).toNot(beNil())
                    expect(accontNumberLabel).toNot(beNil())
                    expect(balanceLabel).toNot(beNil())
                    expect(accontValueLabel).toNot(beNil())
                }
            }
        }
    }
}
