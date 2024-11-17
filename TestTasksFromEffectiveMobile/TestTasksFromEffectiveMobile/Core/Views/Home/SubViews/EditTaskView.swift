//
//  EditTaskView.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/16/24.
//

import SwiftUI

struct EditTaskView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @EnvironmentObject var router: TodoRouter
    var body: some View {
        ZStack {
            
            VStack(spacing: 16) {
                TextField("Title", text: $title)
                    .font(.title)
                    .padding()
                   

                
                TextArea(text: $description, placeholder: "add your todo here")
               
                
                Button{
                    router.goBack()
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

