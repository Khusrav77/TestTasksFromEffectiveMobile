//
//  CustomAlertView.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/16/24.
//

import SwiftUI

struct DetailView: View {
    let todo: TodoEntity
    @EnvironmentObject var router: TodoRouter
    @EnvironmentObject var presenter: TodoPresenterImpl
    var body: some View {
        
        VStack(spacing: 0) {
            
            Spacer()
            
            HStack{
                VStack(alignment: .leading, spacing: 6) {
                    Text(todo.todo ?? "No title")
                        .font(.headline)
                        .foregroundStyle(.primary.opacity(0.9))
                    
                    Text(todo.descriptionn ?? "No description")
                        .font(.subheadline)
                        .foregroundStyle(.primary.opacity(0.9))
                    
                    Text(formatDate(Date()))
                        .font(.subheadline)
                        .foregroundStyle(.primary.secondary)
                }
                .padding()
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(.background.secondary)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal)
            
            Form {
                HStack {
                    Text("Редактировать")
                    
                    Spacer()
                    Button {
                        router.navigate(to: .editTodo(todo: todo))
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                    
                }
                .foregroundStyle(.background)
                .listRowBackground(Color.white)
                
                HStack {
                    Text("Поделиться")
                    
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
                .foregroundStyle(.background)
                .listRowBackground(Color.white)
                
                HStack {
                    Text("Удалить")
                    
                    Spacer()
                    Button {
                        presenter.deleteTodo(todo)
                        router.goBack()
                    } label: {
                        Image(systemName: "trash")
                        
                    }
                }
                .listRowBackground(Color.white)
                .foregroundStyle(.red)
                
            }
            .scrollContentBackground(.hidden)
            .background(Color(.systemGroupedBackground))
            .padding(.horizontal)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.goBack()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                }
            }
        }
        
    }
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: date)
    }
}

