//
//  Calculator.swift
//  CalculatorDemo
//
//  Created by Ebubekir Sezer on 13.03.2021.
//

import Foundation

class Calculator {
    
    var currentValue: Int?
    
    init() {
        
    }
    
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func addAsync(_ a: Int, _ b: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.currentValue = a + b
        }
    }
    
    func addAsync(_ a: Int, _ b: Int, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.currentValue = a + b
            completion()
        }
    }
    
    func substract(_ a: Int, _ b: Int) -> Int {
        return a - b
    }
}
