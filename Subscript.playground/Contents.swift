
// Subscripts


// subscript methods can be read-write or read-only unlike the normal methods

//read-only subscript implementation
import Foundation

struct Measurment{
    var meter: Double

    subscript(index: String) -> Double {
        print(index)
        switch index{
            case "meter":
                return meter
            case "km":
                return meter / 1_000
            default:
                return 0
        }
    }
}

let threeKm = Measurment(meter: 5)
print(threeKm["km"])

struct TimesTable{
    let multiplier: Int
    subscript(index: Int) -> Int{
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
//calling subscript by []
print("six times three is \(threeTimesTable[6])")

//subscript dictionaries
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["birds"] = 2


class Person{
    var myName: String
    
    init(name: String) {
        myName = name
    }
    subscript(name: String) -> String{
        get{
            return "Hello " + name
        }
        set{
            myName = newValue
        }
    }
}

var name = Person(name: "ebu")
print(name["ebu"])
name["ebu"] = "something else"
print(name["ebu"])

//Multiple parameters in subscript
struct Matrix{
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool{
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double{
        get{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

matrix[0,1] = 1.5
matrix[1,0] = 3.2

let someValue = matrix[1,1]
// asertion throwing error
//let someValue = matrix[2,2]


//Type Subscripts
enum Planet: Int{
    case mercury = 1, venus, earth, mars
    static subscript(n: Int) -> Planet{
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)
