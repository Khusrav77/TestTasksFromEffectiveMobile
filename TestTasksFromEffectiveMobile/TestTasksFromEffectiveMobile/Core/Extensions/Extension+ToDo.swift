//
//  Extension+ToDo.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/15/24.
//

import Foundation
import CoreData

extension ToDo {
    func toEntity(context: NSManagedObjectContext) -> TodoEntity {
        let entity = TodoEntity(context: context)
        entity.id = UUID(uuidString: "\(self.id)") ?? UUID()
        entity.todo = todo
        entity.userId = Int16(userId)
        entity.completed = completed
        return entity
    }
}
