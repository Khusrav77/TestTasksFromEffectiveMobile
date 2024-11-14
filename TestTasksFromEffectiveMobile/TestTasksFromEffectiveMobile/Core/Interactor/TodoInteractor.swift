//
//  TodoInteractor.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/14/24.
//

import Foundation

protocol TodoInteractor {
    func fetchTodos() async throws -> [ToDo]
    func saveToDo(_ newTodo: ToDo) throws
    func updateTodo(_ todo: ToDo) throws
    func deleteTodo(_ id: Int) throws
}

final class TodoInteractorImpl: TodoInteractor {
    // MARK: - Properties
    private let apiService: APIService
    
    
    // MARK: - Initializer
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    
    // MARK: - Methods
    func fetchTodos() async throws -> [ToDo] {
        let response = try await apiService.fetchToDos()
        return response.todos
    }
    
    func saveToDo(_ newTodo: ToDo) throws {
        
    }
    
    
    func updateTodo(_ todo: ToDo) {
        
    }
    
    func deleteTodo(_ id: Int) {
        
    }
}
