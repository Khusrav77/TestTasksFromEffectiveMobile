//
//  TodoPresenter.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/14/24.
//
import Foundation


protocol TodoPresenter: ObservableObject {
    var todos: [TodoEntity] { get set }
    func loadTodos()
    func saveTodo(title: String, description: String?)
    func updateTodo(_ todo: TodoEntity, newTitle: String?, newDescription: String?)
    func deleteTodo(_ todo: TodoEntity)
}

class TodoPresenterImpl: TodoPresenter {
   
    // MARK: - Properties
    @Published var selectedTodo: TodoEntity?
    
    @Published var todos: [TodoEntity] = []
   
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var completed: Bool = false
    
    
    private let interactor: TodoInteractor
    
    // MARK: - Initializer
    init(todoInteractor: TodoInteractor) {
        self.interactor = todoInteractor
    }
    
   
    // MARK: - Methods
    func loadTodos()  {
        do {
            todos = try interactor.getTodo()
        } catch {
            print("Error loading todos: \(error)")
        }
    }
    
    func saveTodo(title: String, description: String?) {
        do {
            try interactor.saveNewTask(title: title, description: description)
            loadTodos()
       
        } catch {
            if let error = error as? ErrorService {
                print("Error saving todo: \(error)")
            }
        }
    }
    
    func updateTodo(_ todo: TodoEntity, newTitle: String?, newDescription: String?) {
        do {
            try interactor.updateTask(todo, newTitle: newTitle, newDescription: newDescription)
            loadTodos()
            
        } catch {
            print("Error updating todo: \(error)")
            
        }
    }
    
    func deleteTodo(_ todo: TodoEntity) {
        do {
            try interactor.deleteTask(todo)
            loadTodos()
            
        } catch {
            print("Error deleting todo: \(error)")
        }
    }
}

