//
//  CDLStatements.swift
//  Bank app
//
//  Created by mmalaqui on 20/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit
class CDLStatements : BaseCDL{
    
    override init() {
        super.init()
        cacheID = "CDLStatements"
    }
    
    func getStatements(subscriber: CommonDataLayerSubscriber, userID: Int){
        
        self.dataRequest(with: CommonDataLayerEndpointBuilderEnum.getStatements(userID: userID).endpoint, objectType: CDLStatementsModel.self, httpMethod : .get){ (result: CDLResponse) in
                switch result {
                case .success(let modelToReturn):
                    let response = CDLResponse.success(modelToReturn as CommonDataLayerBaseModel)
                    subscriber.1(response)
                    break
                case .failure(let error):
                    "failed with error \(error)".errorLog()
                    let response = CDLResponse<CommonDataLayerBaseModel>.failure(error)
                    subscriber.1(response)
                    break
                }
        }
    }
    
}
