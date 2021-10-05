//
//  CalculatorTests.swift
//  CalculatorDemoTests
//
//  Created by Ebubekir Sezer on 13.03.2021.
//

import XCTest
@testable import CalculatorDemo

class CalculatorTests: XCTestCase {
    
    var calculator: Calculator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        calculator = nil
    }
}
