//
//  mmBusinessObject.swift
//  mmiOS8
//
//  Copyright (c) 2017 Oak Leaf Enterprises, Inc. All rights reserved.
//
// 11/19/14 
// Changed lightweight migration so it's always on

import Foundation
import CoreData

public enum SaveState {
    case error, rulesBroken, saveComplete
}

open class mmBusinessObject<T: NSManagedObject>
{
    var dbName : String = ""
    var copyDatabaseIfNotPresent : Bool = false
    //var error : NSError?
    
    init() {
    }
    
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.oakleafsd.<ProjectName>" in the application's documents Application Support directory.
    lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls)
        return urls[urls.count-1] 
        }()
    
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
    lazy open var managedObjectContext: NSManagedObjectContext = {
        
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        //managedObjectContext.stalenessInterval = 0.0
        return managedObjectContext
        }()
    
    // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
    lazy var managedObjectModel: NSManagedObjectModel = {
        
        let modelURL = Bundle.main.url(forResource: self.dbName, withExtension: "momd")!
        var model: NSManagedObjectModel? = NSManagedObjectModel(contentsOf: modelURL)
        return model!
        }()
    
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        

        let url : URL = self.getStoreURL()
        
        if self.copyDatabaseIfNotPresent
        {
            
            let dbcPath = url.path
            
            var fileManager = FileManager.default
            
            // Check if the sqlite database already exists
            if !fileManager.fileExists(atPath: dbcPath)
            {
                // It doesn't. Check if a .sqlite database was distributed with this app
                var defaultStorePath = Bundle.main.path(forResource: self.dbName, ofType: "sqlite")
                if defaultStorePath != nil
                {
                    // It was, copy the embedded database to the app's Documents directory
                    do {
                    	try fileManager.copyItem(atPath: defaultStorePath!, toPath: dbcPath)
                    }
                    catch  {
                        //print((error as NSError).localizedDescription)
                    }
                }
            }
        }
        
        // Create the coordinator and store
        let coordinator: NSPersistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        var failureReason = "There was an error creating or loading the application's saved data."
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: [NSMigratePersistentStoresAutomaticallyOption: true,
                NSInferMappingModelAutomaticallyOption: true])
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject?
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject?
            
            //dict[NSUnderlyingErrorKey] = error as! NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    func getStoreURL() -> URL {
        return self.applicationDocumentsDirectory.appendingPathComponent("\(self.dbName).sqlite")
    }
    
    // Saves changes to all entities
    open func saveEntities() -> (state: SaveState, message: String?)
    {
        var saveState: SaveState
        var saveMessage: String?
        
        // Business rules passed
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            }
            catch let error as NSError {
                saveState = SaveState.error
                saveMessage = error.localizedDescription
            }
            saveState = SaveState.saveComplete
            saveMessage = nil
        }
        else {
            saveState = SaveState.saveComplete
            saveMessage = nil
        }
        
        return (saveState, saveMessage)
    }
    
    // Register a related business controller object
    // This causes them to use the same object context
    func registerChildObject(_ controllerObject: mmBusinessObject)
    {
        controllerObject.managedObjectContext = self.managedObjectContext
    }
    
    // Gets the entity class name string from <T>
    var entityClassName : String {
        var className = NSStringFromClass(T.self)
        if className.range(of: ".") != nil {
            
            className = (className as NSString).pathExtension
        }
        return className
    }
    
    // Gets all entities of the default type
    open func getAllEntities() -> Array<T>
    {
        return self.getEntities(sortedBy: nil, matchingPredicate: nil)
    }
    
    // Get all entities sorted by the descriptor and matching the predicate
    func getEntities(sortedBy sortDescriptor:NSSortDescriptor?, matchingPredicate predicate:NSPredicate?) -> Array<T>
    {
        // Create the request object
        let request : NSFetchRequest<T> = NSFetchRequest<T>()
        var list = Array<T>()
        
        // Set the entity type to be fetched
        let entityDescription : NSEntityDescription! = NSEntityDescription.entity(forEntityName: self.entityClassName, in: self.managedObjectContext)
        
        request.entity = entityDescription
        
        if predicate != nil
        {
            request.predicate = predicate
        }
        
        if let descriptor = sortDescriptor
        {
            request.sortDescriptors = [descriptor]
        }
        
        // Execute the fetch
        do {
            list = try self.managedObjectContext.fetch(request)

        }
        catch let error as NSError {
            print("Fetch failed: \(error.localizedDescription)")
        }
        return list

    }
    
    // Gets all entities sorted by descriptor
    func getAllEntitiesSortedBy(_ sortDescriptor:NSSortDescriptor) -> Array<T>
    {
        return self.getEntities(sortedBy: sortDescriptor, matchingPredicate: nil)
    }
    
    // Get entities of the default type matching the predicate
    func getEntitiesMatchingPredicate(_ predicate: NSPredicate) -> Array<T>
    {
        return self.getEntities(sortedBy: nil, matchingPredicate: predicate)
    }
    
    // Get entities of the default type sorted by descriptor and matching the predicate
    func getEntitiesSortedBy(_ sortDescriptor: NSSortDescriptor, matchingPredicate predicate:NSPredicate) -> Array<T>
    {
        return self.getEntities(sortedBy: sortDescriptor, matchingPredicate: predicate)
    }
    
    // Save changes to the specified entity
    func saveEntity(_ entity: T) -> (state: SaveState, message: String?)
    {
        var saveState: SaveState
        var saveMessage: String?
        
        // Check the business rules
        saveMessage = self.checkRulesForEntity(entity)
        
        if saveMessage == nil
        {
            let result = self.saveEntities()
            saveState = result.state
            saveMessage = result.message
        }
        else
        {
            // Business rules failed
            saveState = SaveState.rulesBroken
        }
        return (state: saveState, message: saveMessage)
    }
    
    // Adds the list of entities to this business object context
    func addEntitiesToObjectContext(_ entityList: Array<T>)
    {
        for entityOriginal: T in entityList
        {
            let keys = Array(entityOriginal.entity.attributesByName.keys)
            let dictionary = entityOriginal.dictionaryWithValues(forKeys: keys)
            let entityCopy = self.createEntity()
            entityCopy.setValuesForKeys(dictionary)
        }
    }
    
    // Create a new entity of the default type
    open func createEntity() -> T
    {
        return NSEntityDescription.insertNewObject(forEntityName: self.entityClassName, into: self.managedObjectContext) as! T
    }
    
    // Mark the specified entity for deletion
    open func deleteEntity(_ entity: T)
    {
        self.managedObjectContext.delete(entity)
    }
    
    open func checkRulesForEntity(_ entity: NSManagedObject) -> String?
    {
        return nil
    }
    
}

