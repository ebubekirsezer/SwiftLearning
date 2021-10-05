//
//  CalculatorAddTests.swift
//  CalculatorDemoTests
//
//  Created by Ebubekir Sezer on 13.03.2021.
//

import XCTest
@testable import CalculatorDemo

class CalculatorAddTests: XCTestCase {
    
    var calculator: Calculator!
    override func setUpWithError() throws {
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
    }


    func testAdd() {
        let result = calculator.add(1, 2)
        XCTAssertEqual(result, 3, "Expected 3, but got \(result)")
        XCTAssertLessThan(result, 10)
    }
    
    func testAddAsync() {
        calculator.addAsync(3, 4)
        XCTAssertEqual(calculator.currentValue, 7)
    }
    
    func testAddAsync2() {
        let expect = expectation(description: "Completion block was called")
        calculator.addAsync(3, 4) {
            expect.fulfill()
            XCTAssertEqual(self.calculator.currentValue, 7)
        }
        wait(for: [expect], timeout: 2.0)
    }
}
