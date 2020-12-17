
// Protocols are the blue print of the sturctures or classes

import Foundation

protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var noNeedToBeSettable: Int { get }
    
}

protocol AnotherProtocol{
    static var someTypePropert: Int { get set }
}

protocol FullyNamed{
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let person1 = Person(fullName: "Ebubekir Sezer")


class Starship: FullyNamed {
    
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "")
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)

protocol SomeProtocol2 {
    static func someTypeMethod()
}

protocol RandomNumberGenerator{
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")

print("And another one: \(generator.random())")

//Mutating protocol
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable{
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwithc = OnOffSwitch.off
lightSwithc.toggle()

// init requirements
protocol SomeProtocol3 {
    init(someParameter: Int)
}

class SomeClass: SomeProtocol3 {
    required init(someParameter: Int) {
        
    }
}

protocol SomeProtocol4 {
    init()
}

class SomeSuperClass {
    init() {
        
    }
}

// it need to be defined both required and override because it inherits both
class SomeSubClass : SomeSuperClass, SomeProtocol4 {
    
    required override init() {
        
    }
}

class Dice{
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("random dice \(d6.roll())")
}

/*
 Delegation is a design pattern that take some of the responsibilities of the instance or anotherType
 */
 
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate : AnyObject{
    func gameDidStart(_ games: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}


class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

// extension with protocol
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)

extension SnakesAndLadders: TextRepresentable{
    var textualDescription: String {
        return "final \(finalSquare)"
    }
}

print(game.textualDescription)

// conditional extension protocol
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

let myDice = [d6, d12]
print(myDice.textualDescription)

// protocol also be adopted with extensiob
struct Hamster{
    var name: String
    var textualDescription: String {
        return "A hamster name: \(name)"
    }
}
extension Hamster: TextRepresentable { }

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)

struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)

if twoThreeFour == anotherTwoThreeFour {
    print("they are equal")
}


struct Animal: Equatable{
    var name: String
}
var zebra = Animal(name: "Zebra")
var zebra2 = Animal(name: "Zebra")

if zebra == zebra2 {
    print("they are equal too")
}

enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(stars: Int)
}

var levels = [SkillLevel.intermediate, SkillLevel.beginner,
              SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]

for level in levels {
    print(level)
}

// Collections of protocol types
let things: [TextRepresentable] = [game, d12, simonTheHamster]
print(game.textualDescription)
for thing in things{
    print(thing.textualDescription)
}

// Protocol inheritance
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    
}

protocol PrettyTextRepresentable: TextRepresentable{
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
                for index in 1...finalSquare {
                    switch board[index] {
                    case let ladder where ladder > 0:
                        output += "▲ "
                    case let snake where snake < 0:
                        output += "▼ "
                    default:
                        output += "○ "
                    }
                }
        return output
    }
}
print(game.prettyTextualDescription)

// By adding the AnyObject you can define the protocol only for the classes
protocol SomeClassOnlyProtocol: AnyObject, TextRepresentable{
    
}
// Protocol Composition with &
protocol Named{
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person2: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged){
    print("Happy birthday \(celebrator.name) you are \(celebrator.age)")
}

let birthdayPerson = Person2(name: "Ebubekir", age: 22)
wishHappyBirthday(to: birthdayPerson)

class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location: Location & Named) {
    print("Hello \(location.name)")
}

let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)


protocol HasArea {
    var area: Double {get}
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal2 {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal2(legs: 4)
]

for object in objects {
    
    if let objectWithArea = object as? HasArea {
        print("Area \(objectWithArea.area)")
    } else {
        print("No area")
    }
}

// Optional Protocol Requirements
@objc protocol CounterDataSource{
    @objc optional func incremental(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment(){
        if let amount = dataSource?.incremental?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()

for _ in 1...4 {
    counter.increment()
    print(counter.count)
}


class TowardsZeroSource: NSObject, CounterDataSource {
    func incremental(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()

for _ in 1...5 {
    counter.increment()
    print(counter.count)
}


// Protocol Extension
//extension RandomNumberGenerator {
//    func randomBool() -> Bool {
//        return random() > 0.5
//
//    }
//}
//
//let generator2 = LinearCongruentialGenerator()
//print("random number \(generator2.random())")
//print("random bool: \(generator2.randomBool())")


extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}


extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]

print(equalNumbers.allEqual())
print(differentNumbers.allEqual())
