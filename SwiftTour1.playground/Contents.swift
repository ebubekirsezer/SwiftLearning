
print("Hello World!")

var myVariable = 42
myVariable = 50

// let makes the variable assigned once and using many place
let myConstant = 42

// If you not explicit the data type of the variable it gets the data type that you first initiliazed
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70.0
let constant4 : Int = 4

// Converting int to string by casting to String
let label = "The width is "
let width = 94
let widthLabel = label + String(width)


let apples = 3
let orange = 5
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(orange + apples) pieces of fruit"

//Multiple Line Text
let quatation = """
I said "I have \(apples) apples."
And then I said "I have \(orange + apples) oranges."
This is really good feature
"""

//Array
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1]

//Dictionary key-value
var occupations = [
    "Malcom": "Captain",
    "Kaylee": "Mechanic"
]

// Adding item to Dictonary
occupations["Jayne"] = "Public Relations"

//Adding item to Array
shoppingList.append("blue paint")
print(shoppingList)

// Initiliazing empty array and dictionary
let emptyArray = [String]()
let emptyDictionary = [String: Bool]()


// Also can be initialized empty array and dictionary like that
shoppingList = []
occupations = [:]

// Control Flow
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores{
    if score > 50{
        teamScore += 3
    } else{
        teamScore += 1
    }
}

print(teamScore)

// ? defines the variable can be nil
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello !"
// this if let controls the nil
if let name = optionalName{
    greeting = "Hello, \(name)"
}

// if the name empty default name showing with ??
let nickname: String? = nil
let fullName: String = "Ebubekir Sezer"
let informalGreeting = "Hi \(nickname ?? fullName)"

// Switch case
let vegetable = "cucumber"
switch vegetable {
case "celery":
    print("add somethings :)")
case "cucumber", "watercress":
    print("make an sandwich")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Default add something")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
for (kind, numbers) in interestingNumbers{
    for number in numbers{
        if number > largest{
            largest = number
        }
    }
}

print(largest)

//While and Repeat While loop
var n = 2
while n < 100{
    n *= 2
}

print(n)

var m = 2
repeat{
    m *= 2
} while m < 100

print(m)

// 0.. increase the number to the indexes, arrange the range to upper
var total = 0
for i in 0..<4{
    total += i
}

print(total)


//Functions and Closures

func greet(person: String, day: String) -> String{
    return "Hello \(person), today is \(day)"
}

greet(person: "Ebubekir", day: "Cuma")

func greet2(person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}

greet2(person: "Ebubekir", on: "Cumartesi")

//Using tuples for returning multiple items
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores{
        if score > max{
            max = score
        } else if score < min{
            min = score
        }
        sum += score
    }
    
    return (min,max,sum)
}

let statistics = calculateStatistics(scores: [5,3,100,3,9])
print(statistics.sum)
// this gives the min max and sum with the index
print(statistics.2)

// Nested function
func returnFifteen() -> Int{
    var y = 10
    
    func add(){
        y += 5
    }
    
    add()
    return y
}
returnFifteen()

// returning the value to another function
func makeIncrementer() -> ((Int) -> Int){
    func addOne(number: Int) -> Int{
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// function takes function as arguments
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool{
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}

func lessThanTen(number:Int) -> Bool{
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

numbers.map({(number: Int) -> Int in
    let result = 3 * number
    return result
})


//Object and Classes
class Shape{
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

// Initiliazing the function
class NamedShape{
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape{
    var sideLength: Double
        
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double{
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square width sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

// Using get and set
class EquailateralTriangle: NamedShape{
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get{
            return 3.0*sideLength
        }
        set{
            // new value comes with assigned value
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle width sides of length \(sideLength)"
    }
}

var triangle = EquailateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// usage of willset and didset
class TriangleAndSquare {
    var triangle: EquailateralTriangle{
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square{
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquailateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape ebu")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

//Optional object that can be come nil
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
//that means it can be nil
let sideLength = optionalSquare?.sideLength

//Examining the raw value
enum Rank: Int{
    case ace = 1
    case two, three, four, five
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 1){
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit{
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String{
        switch self {
        case .spades:
            return "spades"
        case .clubs:
            return "clubs"
        case .diamonds:
            return "diamonds"
        case .hearts:
            return "hearts"
        }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

enum ServerResponse{
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese")

switch failure {
case let .result(sunrise, sunset):
    print("Sunrise at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure... \(message)")
}

struct Card{
    var rank: Rank
    var suit: Suit
     
    func simpleDescription() -> String{
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

// Protocols and Extensions
protocol ExampleProtocol{
    var simpleDescription: String {get}
    mutating func adjust()
}

//Protocols can be say interface
// class can modify the everything no need to write mutating
class SimpleClass : ExampleProtocol{
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " now %100 adjust"
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol{
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// adding new features to data types
extension Int: ExampleProtocol{
    var simpleDescription: String {
        return "the number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

print(4.simpleDescription)

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)

//Error Handling
enum PrintError: Error{
    case outOfPaper
    case noToner
    case onFire
}

//throing error
func send(job:Int, toPrinter printerName: String) throws -> String{
    if printerName == "Never has Toner"{
        throw PrintError.noToner
    }
    return "Job sent"
}

//do-catch like try-catch
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never has Toner")
    print(printerResponse)
} catch {
    print(error)
}

//multiple do catch
do{
    let printerResponse = try send(job: 1444, toPrinter: "Ebubekir")
    print(printerResponse)
} catch PrintError.onFire{
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrintError {
    print("Printer error: \(printerError).")
} catch{
    print(error)
}

let printerSucess = try? send(job: 1832, toPrinter: "Ebu")
let printerFailure = try? send(job: 1231, toPrinter: "Never has Toner")

// defer runs before throwing error
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}

fridgeContains("banana")
print(fridgeIsOpen)

// Generic types making functions or other types

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

makeArray(repeating: "knock", numberOfTimes: 4)

//generics can also applied to enums or class
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

//Getting two same type protocols
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
