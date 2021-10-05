//
//  CalculatorSubstractTests.swift
//  CalculatorDemoTests
//
//  Created by Ebubekir Sezer on 13.03.2021.
//

import XCTest
@testable import CalculatorDemo

class CalculatorSubstractTests: XCTestCase {
    
    var calculator: Calculator!
    override func setUpWithError() throws {
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
    }    
    
    func testSubstract() {
        let result = calculator.substract(10, 7)
        XCTAssertEqual(result, 3, "Expected 3, but got \(result)")
    }

}
