import Foundation
import UIKit

typealias CommonDataLayerNotificationBlock =  ((_: CDLResponse<CommonDataLayerBaseModel> ) -> Void)
typealias CommonDataLayerSubscriber = (String, CommonDataLayerNotificationBlock)
class CommonDataLayer {
    
    public static var shared : CommonDataLayer = CommonDataLayer()
    
    private var commonDataLayerCache : Dictionary<String, CommonDataLayerBaseModel> = Dictionary<String, CommonDataLayerBaseModel>()
    private var commonDataLayerNotificationList : Dictionary<String, [CommonDataLayerSubscriber]> = Dictionary<String, [CommonDataLayerSubscriber]>()
    
    
    private init(){
        
    }
    
    func notifyChanges(cacheID: String){
        if let listToNotify = commonDataLayerNotificationList[cacheID] {
            for notify in listToNotify {
                if let responseModel = commonDataLayerCache[cacheID] {
                    let response = CDLResponse.success(responseModel)
                    notify.1(response)
                }
            }
        }
    }
    
    // notification will send the CommonDataLayerBaseModel
    func subscribe(cacheID: String, subscriber : CommonDataLayerSubscriber){
        if let notificationList = commonDataLayerNotificationList[cacheID] {
            if(notificationList.contains(where: { ( _ cdlSubscriber : CommonDataLayerSubscriber) -> Bool in
                return cdlSubscriber.0 == subscriber.0
            })){
                // is already in the subcstiption list
                return
            }else{
                commonDataLayerNotificationList[cacheID]?.append(subscriber)
            }
        }else{
            commonDataLayerNotificationList[cacheID] = [subscriber]
        }
    }
    
    func unsubcribe(cacheID : String, subscriberID: String){
        commonDataLayerNotificationList[cacheID]?.removeAll(where: { ( _ cdlSubscriber : CommonDataLayerSubscriber) -> Bool in
            return cdlSubscriber.0 == subscriberID
        })
    }
    
    func saveToCacheAndNotify(cacheID: String, model: CommonDataLayerBaseModel){
        commonDataLayerCache[cacheID] = model
        notifyChanges(cacheID: cacheID)
    }
    
    func saveToCache(cacheID: String, model: CommonDataLayerBaseModel){
        commonDataLayerCache[cacheID] = model
    }
    
    func returnFromCache(cacheID: String) -> CommonDataLayerBaseModel?{
        return commonDataLayerCache[cacheID]
    }
    
    func removeFromCache(cacheID: String){
        commonDataLayerCache.removeValue(forKey: cacheID)
        notifyChanges(cacheID: cacheID)
    }
    
}
