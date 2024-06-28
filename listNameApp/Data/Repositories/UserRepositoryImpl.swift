//
//  UserDataSource.swift
//  listNameApp
//
//  Created by Cristian Garcia on 25/6/24.
//

import Foundation



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
