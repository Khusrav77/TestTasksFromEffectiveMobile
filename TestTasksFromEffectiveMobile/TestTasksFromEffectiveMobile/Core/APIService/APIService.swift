//
//  APIService.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/14/24.
//

import Foundation

protocol APIService {
    func fetchToDos() async throws -> TodoResponse
}

final class APIServiceImpl: APIService {
    
    // MARK: - Properties
    private let urlTodos = "https://dummyjson.com/todos"
    private let decoder = JSONDecoder()
    
    
    // MARK: - Initializer
    init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    
    // MARK: - Methods
    func fetchToDos() async throws ->  TodoResponse {
        guard let url = URL(string: urlTodos) else { throw ErrorService.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ErrorService.invalidResponse }
            print("DEBUG: Data fetched Success from \(urlTodos)")
        do {
            return try decoder.decode(TodoResponse.self, from: data)
            
        } catch  {
            throw ErrorService.invalidData
        }
        
    }
}
