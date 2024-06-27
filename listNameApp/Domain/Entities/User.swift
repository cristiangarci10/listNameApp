//
//  User.swift
//  listNameApp
//
//  Created by Cristian Garcia on 25/6/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let email: String
    let name: String
    let lastName: String
    let avatar: String
    
    // Propiedades adicionales
    var location: String?
    var phone: String?
    var birthYear: String?

    enum CodingKeys: String, CodingKey {
        case id
        case email
        case name = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct ApiResponse: Codable {
    let data: [User]
}
