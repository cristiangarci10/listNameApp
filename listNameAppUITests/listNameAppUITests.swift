//
//  listNameAppUITests.swift
//  listNameAppUITests
//
//  Created by Cristian Garcia on 25/6/24.
//

import XCTest

final class listNameAppUITests: XCTestCase {

    

    func testNavigationViews() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let scrollViewsQuery = app.scrollViews
        let element = scrollViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element
        element.swipeUp()
        
        let elementsQuery = scrollViewsQuery.otherElements
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["Michael Lawson"]/*[[".buttons[\"Michael Lawson\"].staticTexts[\"Michael Lawson\"]",".staticTexts[\"Michael Lawson\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let backButton = app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Back"]
        backButton.tap()
        element.swipeDown()
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["George Bluth"]/*[[".buttons[\"George Bluth\"].staticTexts[\"George Bluth\"]",".staticTexts[\"George Bluth\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        backButton.tap()
                
      
  
    }

   
}
