//
//  LoginWorker.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright (c) 2019 Accenture. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class LoginWorker
{
    func doLogin()
    {
        let parameters = ["user":"test_user@dd.dd", "password":"Test@1"]
        let httpRequest : HttpRequest<UserAccount> = HttpRequest()
        
        httpRequest.postRequest(servicePath: .LOGIN_PATH, parameters: parameters, success: { (userAccount) in
            print(userAccount)
        }) { (error) in
            
        }
        
//        HttpRequest.postRequest(servicePath: ServicePath.LOGIN_PATH, parameters:parameters, su )
        
//        HttpRequest.sharedInstance.getRequest(servicePath: .STATEMENTS_PATH)
    }
}
