//
//  LoginVewSnapShotTests.swift
//  SantanderTestUITests
//
//  Created by Maria Eugênia Pereira Teixeira on 27/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import SantanderTest


class LoginVewSnapShotTests: QuickSpec {
    
    override func spec() {
        
         describe("LoginVewSnapShotTests") {
            var loginVC: LoginViewController!
            
            beforeEach {
                loginVC = LoginViewController()
                let window = UIWindow(frame: UIScreen.main.bounds)
                window.makeKeyAndVisible()
                window.rootViewController = loginVC
                
            }
            
            it("should present login view") {
                expect(loginVC.view) == snapshot()
            }
            
            it("should present login view with user and password set") {
                expect(loginVC.view) == snapshot()
            }
            
        }
        
    }
}
