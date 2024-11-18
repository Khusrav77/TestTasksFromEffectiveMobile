//
//  CustomTabView.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/16/24.
//

import SwiftUI

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var router: TodoRouter
    @EnvironmentObject var presenter: TodoPresenterImpl
    
    var body: some View {
        TabView(selection: $router.currentTab) {
            TasksView()
                .tag(Destination.Tab.tasks)
                .onAppear {
                    router.navigateToTab(.tasks) // Устанавливаем текущий таб
                }
            
            AddTaskView()
                .tag(Destination.Tab.add)
                .onAppear {
                    router.navigateToTab(.add)
                }
        }
        .overlay(alignment: .bottom) {
            tabBar
        }
    }
    
    private var tabBar: some View {
        HStack {
            Spacer()
            
            Button(action: { router.navigateToTab(.tasks) }) {
                Text("Задачи")
            }
            .foregroundColor(router.currentTab == .tasks ? .yellow : .gray)
            
            Spacer()
            
            Button(action: { router.navigateToTab(.add) }) {
                Image(systemName: "square.and.pencil")
            }
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(router.currentTab == .add ? .yellow : .gray)
            
            Spacer()
        }
        .padding()
    }
}




