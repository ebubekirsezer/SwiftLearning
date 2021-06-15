//
//  SportsInfoUITests.swift
//  SportsInfoUITests
//
//  Created by Ebubekir Sezer on 16.03.2021.
//

import XCTest

class SportsInfoUITests: XCTestCase {

    let application = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        application.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let navBarLabel = application.navigationBars["Sports Info"]
        XCTAssertTrue(navBarLabel.exists)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testEvents() {
        let navBarLabel = application.navigationBars["Sports Info"]
        XCTAssertTrue(navBarLabel.exists)
        //application.collectionViews.staticTexts["Soccer"]
        //application.tables.staticTexts["Soccer"].tap()
//        let leagueLabel = application.navigationBars["League"]
//        XCTAssertTrue(leagueLabel.exists)
        
        
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery.otherElements["Soccer"].staticTexts["Soccer"].tap()
        let leagueLabel = application.navigationBars["League"]
        XCTAssertTrue(leagueLabel.exists)
        
        //tablesQuery.staticTexts["Albanian Superliga"].tap()
    }

    func testLaunchPerformance() throws { 
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
