import UIKit

var keyboards = [3,1]
var drives = [5,2,8]

var keyboards2 = [4]
var drives2 = [5]
var budget = 10

func getMoneySpent(keyboards: [Int], drives: [Int], b: Int) -> Int {
    /*
     * Write your code here.
     */
    
    var highestPrice: Int = 0
    
    for keyboardPrice in keyboards {
        for drivePrice in drives {
            if keyboardPrice + drivePrice <= b {
                if keyboardPrice + drivePrice > highestPrice {
                    highestPrice = keyboardPrice + drivePrice
                }
            }
        }
    }
    
    return (highestPrice != 0 ) ? highestPrice : -1
}


//getMoneySpent(keyboards: keyboards2, drives: drives2, b: budget)


let text = "haveaniceday"

func encryption(s: String) -> String {
    // Write your code here
    let length: Double = Double(s.count)
    let column = Int(length.squareRoot())
    let row = Int(length) / column
    
    let newTextArray: [String] = s.enumerated()
    
    return ""
}

encryption(s: text)
