//
//  UserInfoLocalEntity+CoreDataClass.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/17/21.
//
//

import UIKit
import CoreData

@objc(UserInfoLocalEntity)
public class UserInfoLocalEntity: NSManagedObject {
    
    private static var manageContext: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    
    // MARK: - Static Methods
    
    static func save(_ userInfo: LoginModels.LoggedinUserEntity) {
        let localObject = UserInfoLocalEntity(context: manageContext)
        localObject.userId = Int64(userInfo.userId)
        localObject.name = userInfo.name
        localObject.bankAccount = userInfo.bankAccount
        localObject.agency = userInfo.name
        localObject.balance = userInfo.balance
        
        localObject.save()
    }
    
    static func fetchLast() -> UserInfoLocalEntity? {
        let request: NSFetchRequest<UserInfoLocalEntity> = UserInfoLocalEntity.fetchRequest()
        
        do {
            let localObjects = try manageContext.fetch(request)
            return localObjects.last
        }
        catch { print(error.localizedDescription) }

        return nil
    }
    
    static func clear() {
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: UserInfoLocalEntity.fetchRequest())
        
        do {
            try manageContext.execute(deleteRequest)
        } catch {
            print("Falha ao deletar todos os dados da entity", error.localizedDescription)
        }
    }
    
    
    // MARK: - Methods
    
    private func save() {
        UserInfoLocalEntity.clear()
        
        do {
            try UserInfoLocalEntity.manageContext.save()
        } catch {
            print("Falha ao salvar objeto", error.localizedDescription)
        }
    }
}
