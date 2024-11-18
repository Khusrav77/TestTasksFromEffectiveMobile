//
//  ContentView.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/14/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: TodoRouter

    var body: some View {
        NavigationStack(path: $router.path) {
            MainTabView()
                .navigationDestination(for: Destination.self) { destination in
                    switch destination {
                    case .listTodos:
                        TasksView() // Вкладка со списком задач
                    case .detailsTodo(let todo):
                        DetailView(todo: todo)
                    case .createTodo:
                        AddTaskView() // Экран создания новой задачи
                    case .editTodo(let todo):
                        EditTaskView(todo: todo)
                    }
                }
        }
        .onAppear {
            // Начальная установка таба
            router.navigateToTab(.tasks)
        }
    }
}


#Preview {
    
    ContentView()
        .environmentObject(TodoRouter())
      
}

