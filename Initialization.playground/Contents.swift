
// Initializations


struct Fahrenheit{
    // default initialization
    var temperature = 32.0
    // with init iniliazation
//    init() {
//        temperature = 32.0
//    }
}

var f = Fahrenheit()
print("temperature: \(f.temperature)")


struct Celsius{
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)

let freezingPointOfWater = Celsius(fromKelvin: 273.15)


// parameter names and argument labels
struct Color{
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

// you can not call the without argument labels
// throws error let veryGreen = Color(0.0, 1.0, 0.0)

// If you do not want to use argument label you just need to use _ underscore

// optional value types
class SurveyQuestion{
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    
    func ask(){
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()

cheeseQuestion.response = "yes, i do like"

let beetsQuestion = SurveyQuestion(text: "How about beets?")

beetsQuestion.ask()

beetsQuestion.response = "I also like beets"

//Default initializers
class ShoppingListItem{
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

//memberwise initiliazers
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

let zeroByTwo = Size(height: 2.0)
print("height: \(zeroByTwo.height) width: \(zeroByTwo.width)")

let zeroByZero = Size()
print("height: \(zeroByZero.height) width: \(zeroByZero.width)")

//Custom initialization
struct Size2{
    var width = 0.0, height = 0.0
}

struct Point{
    var x = 0.0, y = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size2()
    init() {
    }
    
    init(origin: Point, size: Size2) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size2) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()

let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size2(width: 5.0, height: 5.0))

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size2(width: 3.0, height: 3.0))

class Vehicle{
    var numberOfWheels = 0
    var description: String{
        return "\(numberOfWheels) wheels"
    }
}

let vehicle = Vehicle()
print("vehicle: \(vehicle.description)")

class Bicycle: Vehicle{
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("bicycle: \(bicycle.description)")

class Hoverboard: Vehicle{
    var color: String
    init(color: String) {
        self.color = color
    }
    override var description: String{
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "yellow")
print("hoverboard: \(hoverboard.description)")


class Food{
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "bacon")

let mysteryMeat = Food()

class RecipeIngredient: Food {
    var quantity: Int
    init(name:String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem2 : RecipeIngredient {
    var purchased = false
    var description: String{
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}


var breakfastList = [
    ShoppingListItem2(),
    ShoppingListItem2(name: "Bacon"),
    ShoppingListItem2(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}


// Failable
let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber){
    print("\(wholeNumber) conversion to \(valueMaintained)")
}

let valueChanged = Int(exactly: pi)

if valueChanged == nil {
    print("\(pi) not maintained")
}


struct Animal{
    let species: String
    init?(species: String) {
        if species.isEmpty{return nil}
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")

if let giraffe = someCreature {
    print("animal initialized \(giraffe)")
}


let anonymousCreature = Animal(species: "")

if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}


enum TemperatureUnit: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil{
    print("defined temperature")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil{
    print("undefined temperature")
}

let fahrenheitVal = TemperatureUnit(rawValue: "F")
if fahrenheitVal != nil{
    print("defined temperature")
}

let unknownUnit2 = TemperatureUnit(rawValue: "X")
if unknownUnit2 == nil{
    print("undefined temperature")
}

class Product {
    let name: String
    init?(name:String) {
        if name.isEmpty {return nil}
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil}
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}


class Document {
    var name: String?
    
    init() { }
    
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document{
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

// Required Initializers
class SomeClass {
    required init(){
        
    }
}

class SomeSubClass: SomeClass{
    // you do not need to override required inits
    required init() {
        
    }
}

//Closuer initiazliaztion

struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
print(board.squareIsBlackAt(row: 5, column: 7))
