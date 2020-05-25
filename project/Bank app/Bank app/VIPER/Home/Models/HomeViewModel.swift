//
//  HomeViewModel.swift
//  Bank app
//
//  Created by mmalaqui on 19/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of Home
class HomeViewModel {
    var idHome: String?
    var user : HomeViewUserModel?
    var statementList : [HomeViewStatementModel]?
    init() {}
    
    init(homeInteractorModel : HomeInteractorModel){
        
        //Setup User
        self.user = HomeViewUserModel()
        self.user?.name = homeInteractorModel.user?.name
        self.user?.balance = homeInteractorModel.user?.balance?.formatCurrency()
        self.user?.accountNumber = homeInteractorModel.user?.accountNumber
        
        //Setup Statement List
        self.statementList = []
        if let statements = homeInteractorModel.statementsList {
            for statement in statements {
                let homeViewStatementModel = HomeViewStatementModel()
                homeViewStatementModel.title = statement.title
                homeViewStatementModel.desc = statement.desc
                homeViewStatementModel.date = statement.date?.format(format: "dd/MM/YYYY")
                homeViewStatementModel.value = statement.value?.formatCurrency()
            
                statementList?.append(homeViewStatementModel)
            }
        }
        
    }

}

class HomeViewUserModel {
    var name : String?
    var accountNumber : String?
    var balance : String?
}


class HomeViewStatementModel {
    var title : String?
    var desc : String?
    var date : String?
    var value : String?
}
