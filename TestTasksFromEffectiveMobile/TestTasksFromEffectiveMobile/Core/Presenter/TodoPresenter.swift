//
//  TodoPresenter.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/14/24.
//
import Foundation


protocol TodoPresenter: ObservableObject {
    var todos: [TodoEntity] { get set }
    func loadTodos() async
    func saveTodo(title: String, description: String?) async
    func updateTodo(_ todo: TodoEntity, newTitle: String?, newDescription: String?) async
    func deleteTodo(_ todo: TodoEntity) async
}

class TodoPresenterImpl: TodoPresenter {
    // MARK: - Properties
    @Published var todos: [TodoEntity] = []
    
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
    
    func saveTodo(title: String, description: String?) async {
        do {
            try interactor.saveToDo(title: title, description: description)
            await loadTodos()
        } catch {
            print("Error saving todo: \(error)")
        }
    }
    
    func updateTodo(_ todo: TodoEntity, newTitle: String?, newDescription: String?) async {
        do {
            try interactor.updateToDo(todo, newTitle: newTitle, newDescription: newDescription)
            await loadTodos()
        } catch {
            print("Error updating todo: \(error)")
        }
    }
    
    func deleteTodo(_ todo: TodoEntity) async {
        do {
            try interactor.deleteTodo(todo)
            await loadTodos()
        } catch {
            print("Error deleting todo: \(error)")
        }
    }
}

