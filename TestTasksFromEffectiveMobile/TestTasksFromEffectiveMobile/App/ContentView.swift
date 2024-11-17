//
//  ContentView.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/14/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var router = TodoRouter()
    
    var body: some View {
        
        NavigationStack(path: $router.path) {
            MainTabView()
                .navigationDestination(for: Destination.self) { destination in
                    switch destination {
                   
                    case.listTodos:
                        MainTabView()
                    
                    case.detailsTodo:
                        DetailView()
                    
                    case.editTodo:
                        EditTaskView(router: router)
                        
                    case.createTodo:
                        AddTaskView()
                    }
                }
        }
        .environmentObject(router)
    }
}

#Preview {
    ContentView()
}

