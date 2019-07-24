//
//  UserCoreDataStore.swift
//  BankApp
//
//  Created by Visão Grupo on 7/21/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import CoreData

class UserCoreDataStore: UserStoreProtocol {
    
    // MARK: Managed object contexts
    
    var mainManagedObjectContext: NSManagedObjectContext
    var privateManagedObjectContext: NSManagedObjectContext
    
    // MARK: Object lifecycle
    
    init() {
        guard let modelURL = Bundle.main.url(forResource: "UserStore", withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }
        
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        mainManagedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        mainManagedObjectContext.persistentStoreCoordinator = psc
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex-1]
    
        let storeURL = docURL.appendingPathComponent("UserStore.sqlite")
        do {
            print("Store URL: \(storeURL.description)")
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
        
        privateManagedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateManagedObjectContext.parent = mainManagedObjectContext
    }
    
    deinit {
        do {
            try self.mainManagedObjectContext.save()
        } catch {
            fatalError("Error deinitializing main managed object context")
        }
    }
    
    // MARK: CRUD operations - Optional error
    
    func createUser(_ user: User, completionHandler: @escaping (User?, UserStoreError?) -> Void) {
        mainManagedObjectContext.perform {
            do {
                let managedUser = NSEntityDescription.insertNewObject(forEntityName: "ManagedUser", into: self.mainManagedObjectContext) as! ManagedUser
                managedUser.fromUser(user)
                
                print(self.mainManagedObjectContext.insertedObjects)
                self.mainManagedObjectContext.insert(managedUser)
                try self.mainManagedObjectContext.save()
                print(self.mainManagedObjectContext.insertedObjects)
                completionHandler(user, nil)
            } catch {
                completionHandler(nil, UserStoreError.CannotCreate("Cannot create user with id \(String(describing: user.userId))"))
            }
        }
    }
    
    func fetchUser(completionHandler: @escaping (User?, UserStoreError?) -> Void) {
        privateManagedObjectContext.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ManagedUser")
                let results = try self.privateManagedObjectContext.fetch(fetchRequest) as! [ManagedUser]
                if let user = results.last?.toUser() {
                    completionHandler(user, nil)
                } else {
                    completionHandler(nil, UserStoreError.CannotFetch("Cannot fetch user"))
                }
            } catch {
                completionHandler(nil, UserStoreError.CannotFetch("Cannot fetch user"))
            }
        }
    }
    
    
    func login(_ login: String, password: String, completionHandler: @escaping (User?) -> Void) {
        
    }
}

