//
//  RandomDataGenerationTests.swift
//  listNameAppTests
//
//  Created by Cristian Garcia on 27/6/24.
//

import XCTest
@testable import listNameApp

final class RandomDataGenerationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRandomLocation() throws {
        let loc = RandomDataGenerator.randomLocation()
        print(loc)
        XCTAssertNotNil(loc)
    }

    func testRandomPhoneNumber() throws {
        let num = RandomDataGenerator.randomPhoneNumber()
        print(num)
        XCTAssertNotNil(num)
        XCTAssertLessThanOrEqual(num.count, 9, "")
    }
    func testRandomBirthDate() throws {
        let date = RandomDataGenerator.randomBirthDate()
        print(date)
        XCTAssertNotNil(date)
    }
}
