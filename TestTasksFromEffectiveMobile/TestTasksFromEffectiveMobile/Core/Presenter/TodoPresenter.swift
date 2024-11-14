//
//  TodoPresenter.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/14/24.
//

import Foundation

protocol TodoPresenter: ObservableObject {
    var todos: [ToDo] { get set}
    func loadTodos() async
    func saveTodo(_ todo: ToDo) async
    func updateTodo(_ todo: ToDo) async
    func deleteTodoById(_ id: Int) async
    
}

class TodoPresenterImpl: TodoPresenter {
    // MARK: - Properties
    @Published var todos: [ToDo] = []
    
    private let interactor: TodoInteractor
    
    
    // MARK: - Initializer
    init(todoInteractor: TodoInteractor) {
        self.interactor = todoInteractor
    }
    
    
    
    // MARK: - Methods
    func loadTodos() async {
        do {
            todos = try await interactor.fetchTodos()
            
        } catch {
            print("Error loading todos: \(error)")
        }
    }
    
    func saveTodo(_ todo: ToDo) async {
        do {
            try interactor.saveToDo(todo)
            await loadTodos()
       
        } catch {
            print("Error saving todo: \(error)")
        }
    }
    
    func updateTodo(_ todo: ToDo) async {
        do {
            try interactor.updateTodo(todo)
            await loadTodos()
            
        } catch {
            print("Error updating todo: \(error)")
        }
    }
    
    func deleteTodoById(_ id: Int) async {
        do {
            try interactor.deleteTodo(id)
            await loadTodos()
            
        } catch  {
            print("Error deleting todo: \(error)")
        }
    }
    
    
}
