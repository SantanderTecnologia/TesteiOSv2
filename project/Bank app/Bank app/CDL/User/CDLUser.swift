//
//  CDLUser.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit
class CDLUser : BaseCDL{
    
    override init() {
        super.init()
        cacheID = "CDLUser"
    }
    
    func performLogin(username: String, password: String, subscriber: CommonDataLayerSubscriber){
        
        let parameters = "user=\(username)&password=\(password)".data(using: .utf8)
            
        self.dataRequest(with: CommonDataLayerEndpointBuilderEnum.postLogin.endpoint, objectType: CDLUserResponseModel.self, httpMethod : .post, parameters: parameters){ (result: CDLResponse) in
                switch result {
                case .success(let modelToReturn):
                    
                    if let user = modelToReturn.userAccount {
                        CommonDataLayer.shared.saveToCache(cacheID: self.cacheID, model: user)

                    }
                    
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
    
    func getUser()-> CDLUserModel?{
        return CommonDataLayer.shared.returnFromCache(cacheID: cacheID) as? CDLUserModel
    }
}
