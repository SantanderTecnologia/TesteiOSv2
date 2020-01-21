//
//  MockServices.swift
//  BankAppTests
//
//  Created by Joni Campos on 26/09/19.
//  Copyright © 2019 Joni Campos. All rights reserved.
//

import Foundation




//Crie a Classe

class MockLoginServices{
    var shouldReturnError = false
    var loginWasCalled = false
   
    
    enum MockServiceError: Error {
        case login
       
    }
    
    func reset(){
        shouldReturnError = false
        loginWasCalled = false
    }
    
    convenience init()
    {
        self.init(false)
    }
    
    init(_ shouldReturnError: Bool){
        self.shouldReturnError = shouldReturnError
    }
    
    
    
        
    
    
    
}



//crie uma extension e ADD the Stubs

extension MockLoginServices: LoginProtocol{
    func login(_ login: String, password: String, completionHandler: @escaping (Login.Something.User?) -> Void) {
        loginWasCalled = true
        
        
        let mockUser = Login.Something.User.self
        
        let resultado = mockUser.init(userId: 1, name: "jose da Silva teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
        
        
        completionHandler(resultado)
    }
    
    
}



