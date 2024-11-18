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
                    router.navigateToTab(.tasks) 
                }
            
            AddTaskView()
                .tag(Destination.Tab.add)
                .onAppear {
                    router.navigateToTab(.add)
                }
        }
        .overlay(alignment: .bottom) {
            CustomTabBar()
        }
    }
    
}




