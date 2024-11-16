//
//  TodoInteractor.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/14/24.
//

import Foundation
import CoreData

protocol TodoInteractor {
    func fetchTodos() async throws -> [TodoEntity]
    func saveToDo(title: String, description: String?) throws
    func updateToDo(_ todo: TodoEntity, newTitle: String?, newDescription: String?) throws
    func deleteTodo(_ todo: TodoEntity) throws
}

final class TodoInteractorImpl: TodoInteractor {
    // MARK: - Properties
    private let apiService: APIService
    private let coreDataManager: CoreDataManager
    
    
    // MARK: - Initializer
    init(apiService: APIService, coreDataManager: CoreDataManager) {
        self.apiService = apiService
        self.coreDataManager = coreDataManager
    }
    
    
    // MARK: - Methods
    func fetchTodos() async throws -> [TodoEntity] {
        let context = coreDataManager.backgroundContext
        let request: NSFetchRequest<TodoEntity> = TodoEntity.fetchRequest()
        
        let savedTodos = try context.performAndWait {
            try context.fetch(request)
        }
        
        if savedTodos.isEmpty {
            try await syncTodosFromAPI()
            return try context.performAndWait {
                try context.fetch(request)
            }
        }
        
        return savedTodos
    }
    
    
    func saveToDo(title: String, description: String?) throws {
        let context = coreDataManager.viewContext
        let newTodo = TodoEntity(context: context)
        newTodo.id = UUID()
        newTodo.todo = title
        newTodo.descriptionn = description
        newTodo.completed = false
        newTodo.createdAt = Date()
        coreDataManager.saveContext()
    }
    
    
    func updateToDo(_ todo: TodoEntity, newTitle: String?, newDescription: String?) throws {
        
        if let newTitle = newTitle {
            todo.todo = newTitle
        }
        
        if let newDescription = newDescription {
            todo.descriptionn = newDescription
        }
        coreDataManager.saveContext()
    }
    
    
    func deleteTodo(_ todo: TodoEntity) throws {
        let context = coreDataManager.viewContext
        context.delete(todo)
        coreDataManager.saveContext()
    }
    
    private func syncTodosFromAPI() async throws {
        let context = coreDataManager.backgroundContext
        let todosResponse = try await apiService.fetchToDos()
        
        context.performAndWait {
            todosResponse.todos.forEach { todo in
                let _ = todo.toEntity(context: context)
            }
            try? context.save()
        }
    }
}
