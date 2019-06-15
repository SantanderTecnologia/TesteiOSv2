//
//  UIResponderParentSpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//
import Quick
import Nimble

@testable import TesteiOSv2

class UIResponderParentSpec : QuickSpec{
    override func spec() {
        describe("UIResponderParentSpec Spec") {
            var parentViewController : UIViewController!
            context("Initilizeview controller and add children view"){
                var childrenView : UIView!
                var isValid : Bool!
                beforeEach {
                    childrenView = UIView()
                    parentViewController = UIViewController()
                    parentViewController.view.addSubview(childrenView)
                    
                    isValid = (parentViewController == childrenView.parentViewController)
                    
                }
                
                it("valid if are same viewController"){
                    expect(isValid).to(beTrue())
                }
 
            }
        }
    }
}
