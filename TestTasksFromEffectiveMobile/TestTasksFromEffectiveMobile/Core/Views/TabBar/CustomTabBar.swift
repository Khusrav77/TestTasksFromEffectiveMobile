//
//  CustomTabBar.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/16/24.
//

import SwiftUI

struct CustomTabBar: View {
    @EnvironmentObject var router: TodoRouter
    @EnvironmentObject var presenter: TodoPresenterImpl
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: { router.navigateToTab(.tasks) }) {
                Text(presenter.todos.count > 0 ? "Задачи (\(presenter.todos.count))" :"Задачи")
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

#Preview {
    CustomTabBar()
}
