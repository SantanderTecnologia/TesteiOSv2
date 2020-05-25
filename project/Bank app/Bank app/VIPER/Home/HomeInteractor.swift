//
//  HomeInteractor.swift
//  Bank app
//
//  Created by mmalaqui on 19/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

protocol HomeInteractorProtocol: AnyObject {
    var homeInteractorModel : HomeInteractorModel? {get set}
    var homeDTO: HomeDTO? {get set}

    func getHomeData(completion: @escaping(_ homeModelEntity : HomeInteractorModel?, _ error: HomeInteractorError?) -> Void)
    func performLogout()
    func cleanup()
}

final class HomeInteractor: BaseInteractor<HomePresenterProtocol>, HomeInteractorProtocol {
    var InteractorID = "HomeInteractor"
    var homeInteractorModel : HomeInteractorModel?
    var homeDTO: HomeDTO? {
        didSet{
            self.homeInteractorModel = HomeInteractorModel(homeDTO: homeDTO)
        }
    }
    
    var cdlStatements = CDLStatements()
    
    func getHomeData(completion: @escaping(_ homeModelEntity : HomeInteractorModel?, _ error: HomeInteractorError?) -> Void) {
         if let homeInteractorModel = homeInteractorModel {
            if let userID = homeInteractorModel.user?.id {
                cdlStatements.getStatements(subscriber : (self.InteractorID, { ( response: CDLResponse? ) -> Void in
                    if let cdlResponse = response {
                        switch cdlResponse {
                        case .failure(let error):
                            completion(nil, HomeInteractorError.convertCDLErrorToInteractorError(cdlError: error))
                            return
                        case .success(let model):
                            self.homeInteractorModel?.statementsList = []
                            if let statementsList = (model as? CDLStatementsModel)?.statementList {
                                for statement in statementsList{
                                    let homeStatementInteractorModel = HomeStatementInteractorModel()
                                    homeStatementInteractorModel.title = statement.title
                                    homeStatementInteractorModel.desc = statement.desc
                                    homeStatementInteractorModel.value = statement.value
                                    
                                    if let strDate = statement.date {
                                        let dateFormatter = DateFormatter()
                                        dateFormatter.dateFormat = "YYYY-MM-dd"
                                        homeStatementInteractorModel.date = dateFormatter.date(from: strDate)
                                    }
                                    
                                    self.homeInteractorModel?.statementsList?.append(homeStatementInteractorModel)
                                }
                            }
                            completion(self.homeInteractorModel, nil)
                            return
                        }
                    }
                    
                    completion(homeInteractorModel, nil)
                    return
                }), userID: userID)

            }else{
                completion(nil, .noUserError)
                return
            }
         }else{
            completion(nil, .noUserError)
            return
        }
    }
    
    
    func performLogout(){
        KeychainUtils.shared.deletePassword()
        KeychainUtils.shared.deleteUsername()
    }
    
    func cleanup(){
        cdlStatements.cleanup(subscriberID: InteractorID)
    }
}
