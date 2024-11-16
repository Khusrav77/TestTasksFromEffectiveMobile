//
//  CustomTabView.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/16/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .tasks
    
    enum Tab: String {
        case tasks = "tasks"
        case add = "add"
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                
                TasksView().tag(Tab.tasks)
                
                AddTaskView().tag(Tab.add)
                
            }
            .overlay(alignment: .bottom) {
                HStack(alignment: .top) {
                    Spacer()
                    
                    Button(action: { selectedTab = .tasks }) {
                        Text("7 задач") }
                    .foregroundColor(selectedTab == .tasks ? .yellow : .gray)
                    Spacer()
                    
                    Button(action: { selectedTab = .add}) {
                        Image(systemName: "square.and.pencil")}
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(selectedTab == .add ? .yellow : .gray)
                    .padding(.trailing)
                    
                }
                .padding()
                .padding(.bottom, 16)
                
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .bottom)
        
    }
}




#Preview {
    MainTabView()
}

