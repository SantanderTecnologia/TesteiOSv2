//
//  Bank_AppTests.swift
//  Bank AppTests
//
//  Created by Andreza on 6/5/19.
//  Copyright © 2019 Gustavo Sousa. All rights reserved.
//

import XCTest
@testable import Bank_App

class Bank_AppTests: XCTestCase {

 //Example Muito Simples. É a primeira vez que uso este recurso. Assisti alguns tutoriais e li alguns posts.
    func verificalabel() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let login = storyboard.instantiateInitialViewController() as! ViewController
        let _ = login.view
        XCTAssertEqual("Username o email", login.login!.placeholder!)
        
    }
    

}
