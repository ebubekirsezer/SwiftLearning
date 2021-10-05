//
//  RequestTests.swift
//  RequestTests
//
//  Created by Karoly Nyisztor on 1/24/21.
//

import XCTest
@testable import Request

class RequestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRequest() throws {
        guard let url = URL(string: "https://www.pluralsight.com/cys") else {
            XCTFail("Error creating URL")
            return
        }
        
        let expectation = XCTestExpectation(description: "Download should succeed")
        
        Request.download(from: url) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data, "No data returned")
            case .failure:
                XCTFail("Unexpected error thrown")
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    
    func testRequestWithSemaphore() throws {
        guard let url = URL(string: "https://www.pluralsight.com") else {
            XCTFail("Error creating URL")
            return
        }
        
        let semaphore = DispatchSemaphore(value: 0)
        
        Request.download(from: url) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data, "No data returned")
            case .failure:
                XCTFail("Unexpected error thrown")
            }
            
            semaphore.signal()
        }
        
        if semaphore.wait(timeout: .now() + 5) == .timedOut {
            XCTFail("The request timed out")
        }
    }
    
    func testAsyncCalls() throws {
        let expectation1 = XCTestExpectation(description: "Task 1 should complete successfully")
        let expectation2 = XCTestExpectation(description: "Task 2 should complete successfully")
        
        DispatchQueue.global(qos: .background).async {
            sleep(2)
            expectation1.fulfill()
        }
        
        DispatchQueue.global(qos: .background).async {
            sleep(1)
            expectation2.fulfill()
        }
        
        //wait(for: [expectation1, expectation2], timeout: 3, enforceOrder: true)
        let result = XCTWaiter.wait(for: [expectation1, expectation2], timeout: 3, enforceOrder: true)
        
        switch result {
        case .completed:
            print("Success")
        case .timedOut:
            XCTFail("Timeout error")
        case .incorrectOrder:
            print("\nIncorrect order, but that's totally fine.\n")
        default:
            XCTFail("Something went wrong")
        }
    }
}
