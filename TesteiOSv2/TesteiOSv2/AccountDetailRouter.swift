//
//  AccountDetailRouter.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 16/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

class AccountDetailRouter : AccountDetailRoutingLogic{
    
    //ViewController of AccountDetailViewController. It's weak for ARC don't count more one reference
    weak var viewController : AccountDetailViewController?
    
    func logOut() {
        //Get this accountDetailViewController and dismiss it.
        guard let accountViewController = viewController else{return}
        accountViewController.dismiss(animated: true, completion: nil)
    }
    
    
}
