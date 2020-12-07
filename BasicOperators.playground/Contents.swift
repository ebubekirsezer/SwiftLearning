let b = 10
var a = 5
a = b

//in tuples x = 1, y= 2
let (x,y) = (1,2)
print(x)
print(y)

//unary minus operator
let three = 3
let minusThree = -three
let plusthree = -minusThree

// unary plus operator actually it does not do so much
let minusSix = -6
let alsoMinusSix = +minusSix

//compound assignment operators
var a1 = 1
a1 += 2
print(a)

//comparision operators
let name = "world"

if name == "world"{
    print("hello, world")
} else{
    print("sorry \(name)")
}

//ternary operator
let contentHeight = 40
let hasHeader = true

let rowHeight = contentHeight + (hasHeader ? 50 : 20)

// nil coalescing opeartor
let defaultNameColor = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultNameColor

//Range operator

//closed range operator (a...b) this means a to b includes a and b
for index in 1...5{
    print(index)
}

//half open range operator
let names = ["ebu", "ebu1", "ebu2", "ebu3", "ebu4"]
let count = names.count
for i in 0..<count{
    print(names[i])
}

//one sided ranges

for name in names[...2]{
    print(name)
}

for name in names[2...]{
    print(name)
}

//onesided incuding the half open range

for name in names[..<2]{
    print(name)
}

//checkinf ranges with contain
let range = ...5
range.contains(7)
range.contains(4)
range.contains(0)
range.contains(-3)


//logical operators
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}


// AND &&
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("welcome")
} else{
    print("access denied")
}

// or ||
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword{
    print("welcome")
} else {
    print("access denied")
}

//combining logic operators
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword{
    print("welcome")
} else{
    print("access denied")
}


// explicit paranthesis
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword{
    print("welcome")
} else{
    print("access denied")
}
