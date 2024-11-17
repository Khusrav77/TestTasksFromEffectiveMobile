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
    @StateObject var presenter = TodoPresenterImpl(todoInteractor: TodoInteractorImpl())
    var body: some View {
            
            VStack(alignment: .leading) {
                
                Text("Задачи")
                    .font(.title)
                    .padding(.leading)
                
                CustomSearchBar(placeholder: "Search", text: $text)
                
                List {
                    ForEach(presenter.todos, id: \.id) { todo in
                        
                        TaskCellView(task: todo)
                    }
                }
                .listStyle(PlainListStyle())
                .onAppear() {
                    presenter.loadTodos()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
           
            
          
    }
}

#Preview {
    TasksView()
}
