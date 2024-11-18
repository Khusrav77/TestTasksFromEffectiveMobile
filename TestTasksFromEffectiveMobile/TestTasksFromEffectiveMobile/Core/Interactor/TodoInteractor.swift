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
    func getTodo()throws -> [TodoEntity] {
        if todos .isEmpty {
            loadTodosFromCoreData()
        }
        return todos
    }
    
    
    func saveNewTask(title: String, description: String?) throws {
        let context = coreDataManager.viewContext
        let newTodo = TodoEntity(context: context)
        newTodo.id = UUID()
        newTodo.todo = title
        newTodo.descriptionn = description
        newTodo.completed = false
        newTodo.createdAt = Date()
        try coreDataManager.saveContext(context)
    }
    
    
    func updateTask(_ todo: TodoEntity, newTitle: String?, newDescription: String?) throws {
        let context = coreDataManager.viewContext
        if let newTitle = newTitle {
            todo.todo = newTitle
        }
        
        if let newDescription = newDescription {
            todo.descriptionn = newDescription
        }
        try coreDataManager.saveContext(context)
    }
    
    
    func deleteTask(_ todo: TodoEntity) throws {
        let context = coreDataManager.viewContext
        context.delete(todo)
        try coreDataManager.saveContext(context)
    }
    
    
    // MARK: - Private Methods
    private  func loadTodosFromCoreData() {
        let request: NSFetchRequest<TodoEntity> = TodoEntity.fetchRequest()
        do {
            todos = try coreDataManager.viewContext.fetch(request)
        } catch  {
            print("Error fetching todos from CoreData: \(error)")
        }
    }
    
    
    private func fetchTodosFromAPI() async throws {
        
        do {
            let todos = try await apiService.fetchToDos()
            saveTodosIpa(todos.todos)
            
        } catch {
            if let error = error as? ErrorService {
                print("Error loading todos from ipa \(error)")
            }
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
            }
            
            do {
                try coreDataManager.saveContext(backgroundContext)
                
            } catch {
                print("Error saving todos to CoreData: \(error)")
            }
        }
    }
    

