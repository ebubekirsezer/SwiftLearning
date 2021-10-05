//
//  CalculatorAddTest.swift
//  CalculatorAppTests
//
//  Created by Ebubekir Sezer on 17.03.2021.
//

import XCTest
@testable import CalculatorApp

class CalculatorAddTest: XCTestCase {

    var calculator: Calculator!
    override func setUpWithError() throws {
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
    }
    
    func testAdd() {
        let result = calculator.add(3, 4)
        XCTAssertEqual(result, 7, "7 bekliyorum ama gelen değer \(result)")
        XCTAssertLessThan(result, 15)
    }
    
    func testAddAsync() {
        let expect = expectation(description: "Bu işlem gerçekleşti")
        calculator.addAsync(3, 4) {
            expect.fulfill()
            XCTAssertEqual(self.calculator.currentValue, 7, "7 bekliyorum ama gelen değer \(self.calculator.currentValue)")
        }
        wait(for: [expect], timeout: 3.0)
    }
}
