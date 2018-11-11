//
//  AppCategoryEntity.swift
//  iAppsReview
//
//  Copyright (c) 2017 Oak Leaf Enterprises, Inc. All rights reserved.
//

import Foundation
import CoreData

class AppCategoryEntity: NSManagedObject {

    @NSManaged var categoryID: NSNumber
    @NSManaged var name: String
}
