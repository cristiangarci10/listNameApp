//
//  UserRepositoryImpl.swift
//  listNameApp
//
//  Created by Cristian Garcia on 28/6/24.
//

import Foundation

final class UserRemoteDataSource {
    
    func fetchUsers(page: Int) async throws -> [User] {
        
        let url = URL(string: "https://reqres.in/api/users?page=\(page)")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
        
        return apiResponse.data
    }
    
}
