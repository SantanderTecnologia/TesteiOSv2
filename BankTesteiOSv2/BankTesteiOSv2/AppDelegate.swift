//
//  AppDelegate.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit
import CoreData
import WorkersLibrary

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
      
      var window: UIWindow?

      static let appDelegate = AppDelegate()
      
      func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
      {
            window?.backgroundColor = uiColorWhite
            
            return true
      }
      
      func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration
      {
            return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
      }
      
      func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>)
      {
      }
      
      lazy var persistentContainer: NSPersistentContainer =
            {
                  let container = NSPersistentContainer(name: "BankTesteiOSv2")
                  container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                        if let error = error as NSError?
                        {
                              fatalError("Unresolved error \(error), \(error.userInfo)")
                        }
                  })
                  return container
            }()
      
      func saveContext ()
      {
            let context = persistentContainer.viewContext
            if context.hasChanges
            {
                  do
                  {
                        try context.save()
                  }
                  catch
                  {
                        let nserror = error as NSError
                        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                  }
            }
      }
      
}

