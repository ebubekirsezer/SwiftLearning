
import Foundation
import Combine

import XCTest

class MyTests: XCTestCase {
    var subscriptions = Set<AnyCancellable>()
    let expectedTitle = "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
    let expectedId = 1
    
    func testPublisher() {
        let _ = APIService.getPosts()
            .sink { error in
                print("Completed subscription \(String(describing: error))")
            } receiveValue: { results in
                print("Got \(results.count) posts back")
                XCTAssert(results.count > 0)
                XCTAssert(results.count == 100, "We got \(results.count) instead of 100 posts back")
                XCTAssert((results.first?.title ?? "") == self.expectedTitle, "We got back the title \(results.first?.title)")
            }
            .store(in: &subscriptions)
    }
}

class TestObserver: NSObject, XCTestObservation {
    
    func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, lineNumber: Int) {
        print("🚫 \(description) line: \(lineNumber)")
    }
    
    func testCaseDidFinish(_ testCase: XCTestCase) {
        if let isSuccess = testCase.testRun?.hasSucceeded,
           isSuccess {
            print("✅ \(testCase)")
        }
    }
}

let observer = TestObserver()
XCTestObservationCenter.shared.addTestObserver(observer)

MyTests.defaultTestSuite.run()
