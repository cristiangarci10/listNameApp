//
//  UserRepostory.swift
//  listNameApp
//
//  Created by Cristian Garcia on 25/6/24.
//

import Foundation

protocol UsersRepository {
    func fetchUsers(page:Int) async throws -> [User]
}
