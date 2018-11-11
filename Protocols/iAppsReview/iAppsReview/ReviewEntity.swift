//
//  ReviewEntity.swift
//  iAppsReview
//
//  Copyright (c) 2017 Oak Leaf Enterprises, Inc. All rights reserved.
//

import Foundation
import CoreData

class ReviewEntity: NSManagedObject {

    @NSManaged var appName: String
    @NSManaged var categoryID: NSNumber
    @NSManaged var comments: String
    @NSManaged var image: String
    @NSManaged var isPosted: NSNumber
    @NSManaged var rating: NSNumber
    @NSManaged var userID: NSNumber

}
