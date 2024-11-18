//
//  TodoCellView.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/15/24.
//

import SwiftUI
import CoreData

struct TaskCellView: View {
    // MARK: - Properties
    let task: TodoEntity
    let action: () -> Void
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            Button {
              action()
            }label: {
                Image(systemName: task.completed ?  "checkmark.circle" : "circle")
                    .foregroundStyle(task.completed ? Color.yellow : Color.secondary)
                
            }
            .buttonStyle(.borderless)
            
            VStack(alignment: .leading, spacing:6) {
                
                if task.completed {
                    Text(task.todo ?? "no todo")
                        .font(.headline)
                        .strikethrough()
                        .foregroundStyle(.primary.secondary)
                    
                } else {
                    Text(task.todo ?? "no todo")
                        .font(.headline)
                        .foregroundStyle(.primary.opacity(0.9))
                    
                }
                
                if task.completed {
                    Text(task.descriptionn ?? "no todo")
                        .font(.subheadline)
                        .foregroundStyle(.primary.secondary)
                } else {
                    Text(task.descriptionn ?? "no todo")
                        .font(.subheadline)
                        .foregroundStyle(.primary.opacity(0.9))
                }
                
                
                Text(formatDate(task.createdAt ?? Date()))
                    .font(.subheadline)
                    .foregroundStyle(.primary.secondary)
                
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .listRowBackground(Color.clear)
        
    }
    
    // MARK: - Mthode
     func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: date)
    }
}


