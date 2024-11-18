//
//  TodoInteractor.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/14/24.
//

import Foundation
import CoreData

protocol TodoInteractor {
    func getTodo()throws -> [TodoEntity]
    func fetchTodosFromAPI() async throws
    func saveNewTask(title: String, description: String?) throws
    func updateTask(_ todo: TodoEntity, newTitle: String?, newDescription: String?) throws
    func deleteTask(_ todo: TodoEntity) throws
}

final class TodoInteractorImpl: TodoInteractor {
    // MARK: - Properties
    private var todos: [TodoEntity] = []
    private let apiService: APIService
    private let coreDataManager: CoreDataManager

    // MARK: - Initializer
    init(apiService: APIService = APIServiceImpl(), coreDataManager: CoreDataManager = CoreDataManagerImpl()) {
        self.apiService = apiService
        self.coreDataManager = coreDataManager
        
    
        loadTodosFromCoreData()
        
    }

    // MARK: - Methods
    func getTodo() throws -> [TodoEntity] {
        if todos.isEmpty {
            loadTodosFromCoreData()
        }
        return todos
    }

    
    func fetchTodosFromAPI() async throws {
       let apiTodos = try await apiService.fetchToDos()
       saveTodosIpa(apiTodos.todos)
   }
    
    
    func saveNewTask(title: String, description: String?) throws {
        let context = coreDataManager.viewContext
        let newTodo = TodoEntity(context: context)
        newTodo.id = UUID()
        newTodo.todo = title
        newTodo.descriptionn = description
        newTodo.completed = false
        newTodo.createdAt = Date()
        try self.coreDataManager.saveContext(context)
        loadTodosFromCoreData()
    }

    
    func updateTask(_ todo: TodoEntity, newTitle: String?, newDescription: String?) throws {
        let context = coreDataManager.viewContext
        if let newTitle = newTitle {
            todo.todo = newTitle
        }
        if let newDescription = newDescription {
            todo.descriptionn = newDescription
        }
        try self.coreDataManager.saveContext(context)
        loadTodosFromCoreData()
    }

    
    func deleteTask(_ todo: TodoEntity) throws {
        let context = coreDataManager.viewContext
        context.delete(todo)
        try self.coreDataManager.saveContext(context)
        loadTodosFromCoreData()
    }

    // MARK: - Private Methods
    private func loadTodosFromCoreData() {
        let request: NSFetchRequest<TodoEntity> = TodoEntity.fetchRequest()
        do {
            todos = try coreDataManager.viewContext.fetch(request)
        } catch {
            print("Error fetching todos from CoreData: \(error)")
        }
    }


    private func saveTodosIpa(_ todos: [ToDo]) {
        let backgroundContext = coreDataManager.backgroundContext
        backgroundContext.perform {
            todos.forEach { todo in
                let entity = TodoEntity(context: backgroundContext)
                entity.id = UUID(uuidString: "\(todo.id)") ?? UUID()
                entity.todo = todo.todo
                entity.userId = Int16(todo.userId)
                entity.completed = todo.completed
            }
            do {
                try self.coreDataManager.saveContext(backgroundContext)
                self.loadTodosFromCoreData()
            } catch {
                print("Error saving todos to CoreData: \(error)")
            }
        }
    }

}



