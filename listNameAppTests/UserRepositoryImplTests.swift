//
//  UserRepositoryImplTests.swift
//  listNameAppTests
//
//  Created by Cristian Garcia on 27/6/24.
//

import XCTest
@testable import listNameApp

final class UserRepositoryImplTests: XCTestCase {

    var sut: UserRepositoryImpl!
    
    override func setUpWithError() throws {
        sut = UserRepositoryImpl()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchUsers() async throws {
        let userList = try await sut.fetchUsers(page: 1)
        XCTAssertTrue(userList.count > 0)
        XCTAssertNotNil(userList.first?.name)
        XCTAssertNotNil(userList.first?.lastName)
        XCTAssertNotNil(userList.first?.avatar)
        XCTAssertNotNil(userList.first?.birthYear)
        XCTAssertNotNil(userList.first?.email)
        XCTAssertNotNil(userList.first?.location)
        XCTAssertNotNil(userList.first?.phone)
    }

}
