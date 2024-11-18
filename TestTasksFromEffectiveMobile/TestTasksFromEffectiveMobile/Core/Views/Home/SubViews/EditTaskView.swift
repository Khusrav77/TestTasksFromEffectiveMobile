//
//  EditTaskView.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/16/24.
//

import SwiftUI

struct EditTaskView: View {
    let todo: TodoEntity
    @State private var title: String = ""
    @State private var description: String = ""
    @EnvironmentObject var router: TodoRouter
    @EnvironmentObject var presenter: TodoPresenterImpl
    var body: some View {
        ZStack {
            
            VStack(spacing: 16) {
                TextField("Title", text: $title)
                    .font(.title)
                    .padding()
                   

                
                TextArea(text: $description, placeholder: "add your todo here")
               
                
                Button{
                    presenter.updateTodo(todo, newTitle: title, newDescription: description)
                    router.goBack(by: 2)
                } label: {
                    Text("Save")
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 55)
                .foregroundStyle(.primary)
                .background(.purple)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Spacer()
                
            }
            .padding()
            .listStyle(.plain)
        }
        .onAppear {
            title = presenter.selectedTodo?.todo ?? ""
            description = presenter.selectedTodo?.descriptionn ?? ""
        }
        
        // MARK: - Navigation Bar
        .navigationTitle("Править задачу")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    router.goBack()
                }label: {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                }
            }
        }
    }
}

