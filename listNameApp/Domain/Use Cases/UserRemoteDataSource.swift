//
//  UserRepositoryImpl.swift
//  listNameApp
//
//  Created by Cristian Garcia on 28/6/24.
//

import Foundation

final class UserRemoteDataSource {
    
    func fetchUsers(page: Int) async throws -> [User] {
        guard let url = URL(string: "\(Configuration.apiBaseURL)/users?page=\(page)") else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        do {
            let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
            return apiResponse.data
        } catch {
            throw URLError(.cannotDecodeRawData)
        }
    }

    
}
