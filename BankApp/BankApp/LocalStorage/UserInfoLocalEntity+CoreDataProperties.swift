//
//  UserInfoLocalEntity+CoreDataProperties.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/17/21.
//
//

import Foundation
import CoreData


extension UserInfoLocalEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfoLocalEntity> {
        return NSFetchRequest<UserInfoLocalEntity>(entityName: "UserInfoLocalEntity")
    }

    @NSManaged public var userId: Int64
    @NSManaged public var name: String
    @NSManaged public var bankAccount: String
    @NSManaged public var agency: String
    @NSManaged public var balance: Float

}
