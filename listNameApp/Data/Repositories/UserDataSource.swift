//
//  UserDataSource.swift
//  listNameApp
//
//  Created by Cristian Garcia on 25/6/24.
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

final class UserRepositoryImpl: UsersRepository {
    
    private let remoteDataSource: UserRemoteDataSource
    
    init(remoteDataSource: UserRemoteDataSource = UserRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchUsers(page: Int) async throws -> [User] {
        var list : [User] = try await remoteDataSource.fetchUsers(page: page)
        for index in list.indices {
            list[index].location = RandomDataGenerator.randomLocation()
            list[index].phone = RandomDataGenerator.randomPhoneNumber()
            list[index].birthYear = RandomDataGenerator.randomBirthDate()
        }
        return list
        
    }
}
