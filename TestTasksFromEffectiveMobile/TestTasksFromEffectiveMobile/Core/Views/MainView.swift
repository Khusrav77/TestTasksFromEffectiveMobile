//
//  MainView.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/15/24.
//

import SwiftUI

struct MainView: View {
    @State var text: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    CustomSearchBar(placeholder: "Search", text: $text)
                      
                    List {
                        ForEach(0..<10) { _ in
            
                          TodoCellView( action: {})
                        }
                    }
                    
                }
                .navigationTitle("Задачи")
            }
            .navigationBarBackButtonHidden(true)
            .background(.background)
            
            
        }
    }
}

#Preview {
    MainView()
}
