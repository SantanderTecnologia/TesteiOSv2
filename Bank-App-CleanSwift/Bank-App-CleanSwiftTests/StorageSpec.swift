//
//  UserDefaultsStorageSpec.swift
//  Bank-App-CleanSwiftTests
//
//  Created by Adriano Rodrigues Vieira on 17/03/21.
//

import Quick
import Nimble
import Foundation

@testable import Bank_App_CleanSwift

class StorageSpec: QuickSpec {
    var worker: LoginStorageWorker!
    
    override func spec() {
        self.worker = LoginStorageWorker(storage: UserDefaultsStorage())
        
        beforeEach {
            let username = "Julie Sweet"
            _ = self.worker.persistUsername(username)
            
            let user = Stubs.VALID_USER
            _ = self.worker.persistUser(user)
        }
        
        
        context("#username") {
            it("persists and gets an username") {
                let storedUsername = self.worker.fetchLastLoggedUsername()
                expect(storedUsername).to(equal("Julie Sweet"))
            }
            
            it("returns false when comparing the saved data with other") {
                let storedUsername = self.worker.fetchLastLoggedUsername()
                expect(storedUsername == "David P. Rowland").to(beFalse())
            }
        }
        
        context("#user") {
            it("persists and gets an user") {
                let storedUser = self.worker.fetchLastLoggedUser()
                expect(storedUser).toNot(beNil())
            }
            
            it("return false when comparing the saved data with other") {
                let storedUser = self.worker.fetchLastLoggedUser()
                expect(storedUser?.username == "leonardo.framil@accenture.com").to(beFalse())
            }
        }
        
        afterEach {            
            _ = self.worker.deleteLastLoggedUsername()
            _ = self.worker.deleteLastLoggedUser()
        }
    }
}

