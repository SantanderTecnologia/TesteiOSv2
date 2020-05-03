//
//  CoreData.swift
//  SANTANDER
//
//  Created by Maíra Preto on 24/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SANTANDER")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveInformation(user: String, password: String) {
        let context = persistentContainer.viewContext
        let person = Person(context: context)
        person.user = user
        person.password = password
        
        try? context.save()
    }
    
    func loadInformation(completion:([Person]) -> Void) {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        let result = try? context.fetch(request)
        let arrayUser = result as? [Person] ?? []
        completion(arrayUser)
    }
    
    func deleteInformation(id: NSManagedObjectID, completion: (Bool) -> Void) {
        let context = persistentContainer.viewContext
        let obj = context.object(with: id)
        context.delete(obj)
        do {
            try context.save()
            completion(true)
        } catch {
            completion(false)
        }
    }
    
}

