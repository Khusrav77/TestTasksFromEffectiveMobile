//
//  TodoRouter.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/16/24.
//

import Foundation

protocol Router: ObservableObject {
    func navigate(to: Destination)
    func goBack()
}

enum Destination {
    case listTodos
    case detailsTodo
    case createTodo
    case editTodo
    
}


class TodoRouter: Router {
   
    @Published var path: [Destination] = []
    
    func navigate(to destination: Destination) {
        path.append(destination)
    }
    
    func goBack() {
        _ = path.popLast()
    }
    
    
}
