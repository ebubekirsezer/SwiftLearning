
// enumeration

enum SomeEnumeration{
    
}


//case define the new enumeration cases
enum CompassPoint: String{
    case north
    case south
    case east
    case west
}

// multiple cases on a single line
enum Planet: Int{
    case mercury = 1, venus, earth, mars
}

print(Planet.mercury.rawValue)
print(Planet.venus.rawValue)
print(Planet.earth.rawValue)

var directionalToHead = CompassPoint.east

directionalToHead = .west
directionalToHead = .south

switch directionalToHead {
case .east:
    print("go east")
case .north:
    print("go north")
case .south:
    print("go south")
case .west:
    print("go west")
}

let somePlanet = Planet.mercury
switch somePlanet {
case .earth:
    print("good place to live")
default:
    print("not a good place to live")
}

// case iterable makes the enum iterable and map the enum
enum Beverage: CaseIterable{
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count
print("case number: \(numberOfChoices)")

for beverage in Beverage.allCases{
    print(beverage)
}

// associated values
// integers and string are associated values this says that they contains int or string
enum Barcode{
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

//adding prefix to the associated values in switch

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("upc: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("qr code: \(productCode)")
}

// just single let or varialbe also works

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("upc: \(numberSystem), \(manufacturer), \(product), \(check)")
case let .qrCode(productCode):
    print("qr code: \(productCode)")
}

//raw values
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

print(ASCIIControlCharacter.tab.rawValue)

let earthsOrder = Planet.earth.rawValue

let sunsetDirection = CompassPoint.east.rawValue

// initilazing from raw value
let possiblePlanet = Planet(rawValue: 2)


let positionToFind = 6

if let somePlanet2 = Planet(rawValue: positionToFind){
    switch somePlanet2 {
    case .earth:
        print("harmless")
    default:
        print("not a safe place")
    }
}

//recursive enumerations is the using the associated values multiple times in the cases using by the indirect
enum ArithmeticExpression{
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

//this also work
indirect enum ArithmeticExpression2{
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let three = ArithmeticExpression.number(3)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(three, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(5))


func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
