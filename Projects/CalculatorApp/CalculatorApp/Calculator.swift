//
//  Calculator.swift
//  CalculatorApp
//
//  Created by Ebubekir Sezer on 17.03.2021.
//

import Foundation

class Calculator {
    
    var currentValue: Int
    
    init() {
        currentValue = 0
    }
    
    func add(_ a: Int, _ b: Int) -> Int {
        currentValue = a + b
        return currentValue
    }
    
    func addAsync(_ a: Int, _ b: Int, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.currentValue = a + b
            completion()
        }
    }
    
    func substract(_ a: Int, _ b: Int) -> Int {
        currentValue = a - b
        return currentValue
    }
}
