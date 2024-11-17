//
//  Extension+TodoEntity.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/15/24.
//

import Foundation
import CoreData

extension TodoEntity {
    static func previewInstance(context: NSManagedObjectContext) -> TodoEntity {
        let todo = TodoEntity(context: context)
        todo.id = UUID()
        todo.todo = "Test Todo"
        todo.completed = false
        return todo
    }
}
