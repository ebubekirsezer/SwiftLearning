import Foundation

func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    
    if (x1 > x2) {
        if (v1 >= v2) {
            return "NO"
        }
        else {
            if (x1 + v1 == x2 + v2) {
                return "YES"
            } else {
                return kangaroo(x1: x1 + v1, v1: v1, x2: x2 + v2, v2: v2)
            }
            
        }
    } else if (x2 > x1) {
        if (v2 >= v1) {
            return "NO"
        }
        else {
            if (x1 + v1 == x2 + v2) {
                return "YES"
            } else {
                return kangaroo(x1: x1 + v1, v1: v1, x2: x2 + v2, v2: v2)
            }
        }
    }
    else {
        return "NO"
    }
}

//27  33  39 45 51 57 63 69

kangaroo(x1: 21, v1: 6, x2: 47, v2: 3)
//kangaroo(x1: 0, v1: 3, x2: 4, v2: 2)


func plusMinus(arr: [Int]) -> Void {
    // Write your code here
    
    var positiveNumbers: [Int] = []
    var negativeNumbers: [Int] = []
    var zeroNumbers: [Int] = []
    
    
    for item in arr {
        if item < 0 {
            negativeNumbers.append(item)
        } else if item > 0 {
            positiveNumbers.append(item)
        } else {
            zeroNumbers.append(item)
        }
    }
        
    let positiveNumberProbabilty = String(format: "%.6f", Double(positiveNumbers.count) / Double(arr.count))
    let negativeNumberProbabilty = String(format: "%.6f", Double(negativeNumbers.count) / Double(arr.count))
    let zeroNumberProbabilty = String(format: "%.6f", Double(zeroNumbers.count) / Double(arr.count))
    
    print("\(positiveNumberProbabilty)\n\(negativeNumberProbabilty)\n\(zeroNumberProbabilty)")
}


let arr = [-4, 3, -9, 0, 4, 1]

plusMinus(arr: arr)


func staircase(n: Int) -> Void {
    // Write your code here
    var itemIndex = 1
    
    for item in (1...n).reversed() {
        var stairString = ""
        for index in 1...item {
            if index != 1 {
                stairString += " "
            }
        }
        for _ in 1...itemIndex {
            stairString += "#"
        }
        print(stairString)
        itemIndex += 1
    }
}

staircase(n: 12)

func miniMaxSum(arr: [Int]) -> Void {
    // Write your code here
    var startSum = 0
    var endSum = 0
    
    for item in 0..<arr.count-1 {
        startSum += arr[item]
    }
    
    for item in 1..<arr.count {
        endSum += arr[item]
    }
    
    print("\(startSum) \(endSum)")
    
}

var arr2 = [1, 2, 3, 4, 5]
var arr3 = [1, 3, 5, 7, 9]
var arr4 = [7, 69, 2, 221, 8974]


miniMaxSum(arr: arr4)
