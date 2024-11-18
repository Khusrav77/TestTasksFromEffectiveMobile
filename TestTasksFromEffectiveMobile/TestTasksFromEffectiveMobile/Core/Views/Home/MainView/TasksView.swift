//
//  MainView.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/15/24.
//

import SwiftUI

struct TasksView: View {
    @State var text: String = ""
    @EnvironmentObject var router: TodoRouter
    @EnvironmentObject var presenter: TodoPresenterImpl
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Задачи")
                .font(.title)
                .padding(.leading)
            
            CustomSearchBar(placeholder: "Search", text: $text)
            
            if presenter.todos.isEmpty {
                ProgressView("Loading todos...")
                    .task {
                        await presenter.fetchTodosApi()
                    }
            } else {
                List {
                    ForEach(presenter.todos, id: \.id) { todo in
                        
                        TaskCellView(task: todo) {
                            presenter.completeTodo(todo)
                        }
                            .onTapGesture {
                                router.navigate(to: .detailsTodo(todo: todo))
                                presenter.selectedTodo = todo
                            }
                        
                    }
                    .onDelete(perform: presenter.deletAtOffset)
                    
                }
                .listStyle(PlainListStyle())
                
            }
            
        }
        
    }
}


