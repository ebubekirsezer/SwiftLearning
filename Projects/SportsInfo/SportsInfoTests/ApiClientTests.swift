//
//  ApiClientTests.swift
//  SportsInfoTests
//
//  Created by Ebubekir Sezer on 14.03.2021.
//

import XCTest
@testable import SportsInfo

class ApiClientTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchManagers() {
        let expect = expectation(description: "fetch events")
        let apiClient = SportWebService().getEventsOnTurkey(query: "eventspastleague.php?id=4339") { (result) in
            expect.fulfill()
            switch result {
            case .success(let result):
                XCTAssertNotNil(result.events)
            case .failure(let error):
                print(error)
                XCTFail()
            }
        }
        
        waitForExpectations(timeout: 2.0, handler: nil)
    }
    
    func testCalculateTotalPerformance() {
        self.measure {
             
        }
    }
}
