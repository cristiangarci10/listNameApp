//
//  PrincipalVM.swift
//  listNameApp
//
//  Created by Cristian Garcia on 25/6/24.
//

import Foundation
import Combine
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var errorMessage: String = ""

    private let userRepositoryImpl: UserRepositoryImpl

    init(userRepositoryImpl: UserRepositoryImpl = UserRepositoryImpl()) {
        self.userRepositoryImpl = userRepositoryImpl
        loadUsers(pages: [1,2])
    }

    func loadUsers(pages: [Int]) {
        pages.forEach { page in
            Task {
                do {
                    let fetchedUsers = try await userRepositoryImpl.fetchUsers(page: page)
                    DispatchQueue.main.async {
                        fetchedUsers.forEach { user in
                            self.users.append(user)
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
        }
    }
}

