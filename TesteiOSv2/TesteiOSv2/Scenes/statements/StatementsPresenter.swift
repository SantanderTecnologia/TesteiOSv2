//
//  StatementsPresenter.swift
//  TesteiOSv2
//
//  Created by Foliveira on 12/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation

protocol StatementsPresenterProtocol {
    func presentUserData(data: [Statement])
}

class StatementsPresenter: StatementsPresenterProtocol {
    
    var controller: StatementsViewControllerProtocol?
    
    func presentUserData(data: [Statement]) {
        //
        DispatchQueue.main.async {
            self.controller?.showUserData(data: data)
        }
        
    }
    
}
