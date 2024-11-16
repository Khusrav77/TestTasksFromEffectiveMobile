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
    @State var completed: Bool = false
    let action: () -> Void
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            Button {
                action()
            }label: {
                Image(systemName: completed ?  "checkmark.circle" : "circle")
                    .foregroundStyle(completed ? Color.yellow : Color.secondary)
                
            }
            .buttonStyle(.borderless)
            
            VStack(alignment: .leading, spacing:6) {
                
                if completed {
                    Text("Почитать книгу")
                        .font(.headline)
                        .strikethrough()
                        .foregroundStyle(.primary.secondary)
                    
                } else {
                    Text("Почтитать книгу")
                        .font(.headline)
                        .foregroundStyle(.primary.opacity(0.9))
                    
                }
                
                if completed {
                    Text("про java и swift")
                        .font(.subheadline)
                        .foregroundStyle(.primary.secondary)
                } else {
                    Text("про java и swift")
                        .font(.subheadline)
                        .foregroundStyle(.primary.opacity(0.9))
                }
                
                
                Text(formatDate(Date()))
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


#Preview {
    
    
    TaskCellView(action: {})
}
