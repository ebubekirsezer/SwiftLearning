

//Closures
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)
print(names.sorted())
print(reversedNames)


reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

print(reversedNames)
//in a single line
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )

reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

var a = names.sorted(by: { $0 > $1 } )
print(a)

reversedNames = names.sorted(by: >)

//trailing closures

func someFunctionTakesClosures(closuer: () -> Void){
    
}

someFunctionTakesClosures(closuer: {
    
})

someFunctionTakesClosures {
    
}


let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map{ (number) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

print(strings)

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()

let alsoIncrementByTen = incrementByTen
incrementByTen()
alsoIncrementByTen()

var completionHandlers = [() -> Void]()

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}


func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

struct SomeStruct {
    var x = 10
    mutating func doSomething() {
        someFunctionWithNonescapingClosure { x = 200 }  // Ok
//        someFunctionWithEscapingClosure { x = 100 }     // Error
    }
}

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)


func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )


func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))

var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
