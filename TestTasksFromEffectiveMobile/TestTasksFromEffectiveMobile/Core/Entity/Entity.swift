//
//  Entity.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/14/24.
//

import Foundation

struct ToDo: Codable, Identifiable {
    let id: Int
    let todo: String
    let userId: Int
    let completed: Bool
}


struct TodoResponse: Codable {
    let todos: [ToDo]
    let total: Int
    let skip: Int
    let limit: Int
}
