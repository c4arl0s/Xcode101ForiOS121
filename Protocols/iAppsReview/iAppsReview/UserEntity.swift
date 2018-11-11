//
//  UserEntity.swift
//  iAppsReview
//
//  Copyright (c) 2017 Oak Leaf Enterprises, Inc. All rights reserved.
//

import Foundation
import CoreData

class UserEntity: NSManagedObject {

    @NSManaged var email: String
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var password: String
    @NSManaged var userID: NSNumber

}
