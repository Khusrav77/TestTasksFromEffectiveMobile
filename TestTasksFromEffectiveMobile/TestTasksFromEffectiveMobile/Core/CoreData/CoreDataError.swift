//
//  CoreDataError.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/17/24.
//

import Foundation

enum CoreDataError: String, Error {
    case saveError = "Failed to save context:"
    case fetchError = "Failed to fetch context:"
    case deleteError = "Failed to delete context:"
}
