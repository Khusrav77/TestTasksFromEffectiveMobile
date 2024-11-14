//
//  CoreDataManager.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/14/24.
//

import Foundation
import CoreData

final class CoreDataManager {
    // MARK: - Properties
    static let shared = CoreDataManager()
    
    private let persistentContainer: NSPersistentContainer
    
    
    // MARK: - Computed properties
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var backgroundContext: NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
    
    
    // MARK: - Initializer
    private init() {
        persistentContainer = NSPersistentContainer(name: "Entities")
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.loadPersistentStores {storeDescription, error  in
            if let error = error as NSError? {
                fatalError("DEBUG: Unresolved error \(error.localizedDescription), \(error.userInfo)")
            }
        }
    }
    
    
    // MARK: - Methods
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
