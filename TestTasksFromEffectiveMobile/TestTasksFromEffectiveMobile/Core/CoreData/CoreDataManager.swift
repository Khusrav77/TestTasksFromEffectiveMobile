//
//  CoreDataManager.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/14/24.
//

import Foundation
import CoreData

protocol CoreDataManager {
    var viewContext: NSManagedObjectContext { get }
    var backgroundContext: NSManagedObjectContext { get }
    
    func saveContext(_ context: NSManagedObjectContext) throws
   
    
}

final class CoreDataManagerImpl: CoreDataManager {
    
    // MARK: - Properties
    private let persistentContainer: NSPersistentContainer
    
    
    // MARK: - Computed properties
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var backgroundContext: NSManagedObjectContext {
        let context = persistentContainer.newBackgroundContext()
        context.automaticallyMergesChangesFromParent = true
        return context
    }

    
    
    // MARK: - Initializer
    init() {
        persistentContainer = NSPersistentContainer(name: "TodoContainer")
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.loadPersistentStores {storeDescription, error  in
            if let error = error as NSError? {
                fatalError("DEBUG: Unresolved error \(error.localizedDescription), \(error.userInfo)")
            }
        }
    }
    
   
    
    // MARK: - Methods
    func saveContext(_ context: NSManagedObjectContext)throws {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                throw CoreDataError.saveError
            }
        }
    }
    
}
