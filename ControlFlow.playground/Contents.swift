
// Control Flow

// for in loop
let names = ["Ebubekir","Ronaldo", "Messi", "Mesut Ozil"]
for name in names{
    print("Hello \(name)")
}


//tuples
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs{
    print("name: \(animalName) leg count: \(legCount)")
}

//ranges
for i in 1...5 {
    print(i)
}

//if you dont need the value _ is enough to define
let base = 3
let power = 10
var answer = 1
for _ in 1...power{
    answer *= base
}

print(answer)

//ranges
let minutes = 60
for tickMark in 0..<minutes{
    print(tickMark)
}

//stride helps to skip 5
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval){
    print(tickMark)
}

//closed ranges
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, to: hours, by: hourInterval){
    print(tickMark)
}

//while
var isContinue = 5

while isContinue < 10{
    print(isContinue)
    isContinue += 1
}

var a = 0
repeat{
    print(a)
    a += 1
} while a < 5

//if statement
var temperature = 90
if temperature <= 32 {
    print("its cold")
} else if temperature > 85{
    print("its hot")
} else {
    print("not that cold")
}

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

// in swift, switch does not need a break

let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}


var number = 4

switch number {
case 0...3:
    print("small")
case 4...7:
    print("normal")
case 8...10:
    print("high")
default:
    print("something else")
}

//tuples can be controlled on the switch too
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

// value binding is the giving the temporary constants or variables giving the body of case
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

//where controls the additional situations
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//compound cases there can be a case that have lots of situation with separeted by commas
let someCharacter2: Character = "e"
switch someCharacter2 {
case "a", "e", "i", "o", "u":
    print("\(someCharacter2) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter2) is a consonant")
default:
    print("\(someCharacter2) is not a vowel or a consonant")
}

//compound cases can have value bindings too
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

//contiue when it comes it jumps to other
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)

//break end the execution

//fall through skip the bottom case

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)


//label name make an opputurtuniy to the break or continue to the specific condition
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")
var diceRoll = 0

//guard like if statement but it requires the condition true also it has to have an else
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Hello \(name)!")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }

    print("I hope the weather is nice in \(location).")
}
greet(person: ["name": "Ebu"])
