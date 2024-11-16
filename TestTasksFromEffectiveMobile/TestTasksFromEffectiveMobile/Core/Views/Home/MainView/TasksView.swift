//
//  MainView.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/15/24.
//

import SwiftUI

struct TasksView: View {
    @State var text: String = ""
    var body: some View {
            
            VStack(alignment: .leading) {
                
                Text("Задачи")
                    .font(.title)
                    .padding(.leading)
                
                CustomSearchBar(placeholder: "Search", text: $text)
                
                List {
                    ForEach(0..<10) { _ in
                        
                        TaskCellView( action: {})
                    }
                }
                
                .listStyle(PlainListStyle())
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
           
            
          
    }
}

#Preview {
    TasksView()
}
