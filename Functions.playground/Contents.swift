
//defining function
func greeting(person: String) -> String{
    let greet = "Hello " + person
    return greet
}

print(greeting(person: "Ebubekir"))

func sayHello() -> String{
    return "hello world!"
}

print(sayHello())

func greeting(person:String, alreadyGreeted: Bool) -> String{
    if alreadyGreeted{
        return "we greet before"
    } else {
        return greeting(person: person)
    }
}

print(greeting(person: "ebu", alreadyGreeted: false))

func sayHi(person:String){
    print("Hi, \(person)")
}

print(sayHi(person: "ebu"))

//tuple can also be optionsal

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {return nil}
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        } else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("max: \(bounds.max) min: \(bounds.min)")
}

//implicit return
func greeting2(for person: String) -> String {
    "hellowww"
}

print(greeting2(for: "ebube"))

func greeting(person: String, from hometown: String) -> String{
    return "hello from, \(hometown) to \(person)"
}

print(greeting(person: "ebu", from: "ebu"))

//if you dont wanna argument label just put _
func someFunc(_ person:String) -> String{
    return "whatss upp"
}

print(someFunc("hey"))

func someFunc(person: String, person2: String = "ebu") -> String{
    return "hello, \(person + " " + person2)"
}

print(someFunc(person: "fsadfas"))
print(someFunc(person: "fsadfas", person2: "fads"))


//variadic parameters accept the 0 or more specified type
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)

//to change the fuction parameters you have to define as inout
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapInts(a: inout Int, b: inout Int){
    let temporary = a
    a = b
    b = temporary
}

var a = 5
var b = 10

swapInts(a: &a, b: &b)
print("a: \(a) b: \(b)")

func addTwoInts(_ a: Int, _ b: Int) -> Int{
    return a + b
}

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(3,3))")

//function types can be also parameter
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

//nested function have the functions has function inside

func thereIsAFuncInsideMe(){
    
    print("outside func")
    
    func hello(){
        print("hello from nested")
    }
    
}

thereIsAFuncInsideMe()
