//
//  ABusinessObject.swift
//  TypeCastingDemo
//
//  Copyright (c) 2017 Oak Leaf Enterprises, Inc. All rights reserved.
//

import Foundation
import CoreData

open class ABusinessObject<T: NSManagedObject>: mmBusinessObject<T> {
    
    override init() {
        super.init()
        
        self.dbName = "iAppsReview"
        self.copyDatabaseIfNotPresent = true
    }
}
