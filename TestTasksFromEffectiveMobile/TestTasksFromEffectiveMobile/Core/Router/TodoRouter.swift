//
//  TodoRouter.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/16/24.
//

import Foundation

protocol Router: ObservableObject {
    func navigateToTab(_ tab: Destination.Tab)
    func navigate(to destination: Destination)
    func goBack()
    func goBackToRoot()
    func goBack(by steps: Int)
}

enum Destination: Hashable {
    case listTodos
    case detailsTodo(todo: TodoEntity)
    case createTodo
    case editTodo(todo: TodoEntity)
    
    
    
    enum Tab: String {
        case tasks = "tasks"
        case add = "add"
    }
}




import Foundation

class TodoRouter: ObservableObject {
    @Published var path: [Destination] = []
    @Published var currentTab: Destination.Tab = .tasks 
    
    func navigateToTab(_ tab: Destination.Tab) {
        currentTab = tab
    }
    
    func navigate(to destination: Destination) {
        path.append(destination)
    }
    
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func goBackToRoot() {
        path.removeAll()
    }
    
    func goBack(by steps: Int) {
        guard steps > 0 && steps <= path.count else { return }
        path.removeLast(steps)
    }
}


