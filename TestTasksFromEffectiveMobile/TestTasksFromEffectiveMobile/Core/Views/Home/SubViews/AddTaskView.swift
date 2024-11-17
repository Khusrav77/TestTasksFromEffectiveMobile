//
//  AddTaskView.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/16/24.
//

import SwiftUI

struct AddTaskView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    
   
    var body: some View {
        ZStack {
            
            VStack(spacing: 16) {
                TextField("Title", text: $title)
                    .font(.headline)
                    .padding()
                   
                TextArea(text: $description, placeholder: "add your todo here")
                
                Button{
                    
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
        
        // MARK: - Navigation Bar
        .navigationTitle("New Task")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    
                }label: {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        AddTaskView()
    }
    
}
