// value of the constant cant be change
// varible can be change

//Declaring constants and variables
let maximumLogintAttempt = 10
var currentLoginAttemt = 0

//multiple variables in a line
var a = 0.0, b = 24, c = "ebu"

//Type annotaion means that you declare the type of the variable and you expected to have that type
var message: String
message = "merhaba"

//multiple type annotaion in a single line
var x, y, z : Double

// changing data of the variable
var myMessage = "heyy"
myMessage = "yep"

//let cant be change
let myMessage2 = "heyy"
// myMessage2 = "yep" this cause an error

//printing constants and variables
print(myMessage)

//String interpolation
print("Really good message: \(myMessage2)")

//integer bounds
let minValue = UInt8.min
let maxValue = UInt8.max
print("Min: \(minValue)     Max: \(maxValue)")

//swift automatically defines the integer by looking the 32 bit or 64 bit
// unsigned integers defined by UInt

//Double 64 bit Floating point and Float represents 32 bit floating point


//inferred to be int
let meaningOfLife = 42

//swift always chooses double rather than float
let pi = 3.14159

//this also be inferred to double
let anotherPi = 3 + 0.14159

//Numerical Literals
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation 0b defines binary
let octalInteger = 0o21           // 17 in octal notation 0o defines octal
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation 0x defines hexadecimal

//we can use underscore to sepate from zeros
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let overOneMillion = 1_000_000_000_1

//uint cant not have negative number and max + 1 value that exceed the max
//let negativeInt: UInt8 = -5
//let maxInt: UInt8 = UInt8.max + 1

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

//Typealias means that you give a name to the existing type
typealias AudioSample = UInt16

var maxAudio = AudioSample.max

//Booleans
let orangeAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious{
    print("tasty")
} else{
    print("Eww..")
}

//Tuples
// tuple of type (int, string)
let http404Error = (404,"Not Found")

// we can access the tuples values by defining like that
let (statusCode, statustMessage) = http404Error
print("Status Code: \(statusCode)")
print("Status Message: \(statustMessage) ")

//if you just need to one variable just define the other with _
let (justCode, _) = http404Error
print("just code: \(justCode)")

//also elements can be defined in tuples
let http200Status = (statusCode: 200, description: "OK")
print("Status code: \(http200Status.statusCode)")
print("Status description: \(http200Status.description)")

//converting value can be null
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) // this become optional int

//nil
var serverResponseCall: Int? = 404
serverResponseCall = nil

//if you wont define the variable it will be automatically nill
var someAnswer: String?

// checking nil with if
if convertedNumber != nil {
    print("not nil")
    print("forcely usage we sure that not nil \(convertedNumber!)")
}

// Optional binding
if let actualNumber = Int(possibleNumber){
    print("\(actualNumber)")
} else{
    print("can not convert: \(possibleNumber)")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation point

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation point

let optionalString = assumedString //this is ? optional string assumed string not forced to unwrapped

//checking the assumedstring
if assumedString != nil{
    print(assumedString!)
}

if let notNilAssumedString = assumedString{
    print(notNilAssumedString)
}

//throwing error with function
func canThrowError() throws {
    
}

do {
    try canThrowError()
} catch  {
    // catch the error
}

//catching different types of error
func makeASandwich() throws {
}

//do {
//    try makeASandwich()
//    eatASandwich()
//} catch SandwichError.outOfCleanDishes {
//    washDishes()
//} catch SandwichError.missingIngredients(let ingredients) {
//    buyGroceries(ingredients)
//}

// debugging with assertions
let age = -3
//assert(age >= 0, "A person can not be have age less than zero")
//assert(age >= 0)

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    //assertionFailure("A person's age can't be less than zero.")
}

/*
 Preconditions means that you have condition that maybe false but you want to continue with the true
 to continue execution
 */

var index = -1
precondition(index > 0, "Index must be greater than zero")
