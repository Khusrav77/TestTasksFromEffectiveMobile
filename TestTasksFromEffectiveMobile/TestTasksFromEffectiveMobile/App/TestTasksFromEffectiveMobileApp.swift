//
//  TestTasksFromEffectiveMobileApp.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/14/24.
//

import SwiftUI

@main
struct TestTasksFromEffectiveMobileApp: App {
    @StateObject var router = TodoRouter()
    @StateObject var presenter = TodoPresenterImpl(todoInteractor: TodoInteractorImpl())
    @AppStorage("isDarkMode") private var isDarkMode = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(router)
                .environmentObject(presenter)
        }
    }
}
