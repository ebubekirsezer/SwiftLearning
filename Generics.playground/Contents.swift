
// Generics

func swapTwoInts(_ a: inout Int, _ b: inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)

print("some int \(someInt) another int \(anotherInt)")

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// generic functions can work with any type
func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}

swapTwoValues(&someInt, &anotherInt)
print("some int \(someInt) another int \(anotherInt)")

var someString = "Ebu"
var anotherString = "Ebubekir"
swapTwoValues(&someString, &anotherString)
print("some string \(someString), another string \(anotherString)")


//Non generic version of stack
struct InStack {
    var items = [Int]()
    mutating func push(_ item: Int){
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// generic stack
struct Stack<Element>{
    var items = [Element]()
    mutating func push(_ item: Element){
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

let deleteFromTop = stackOfStrings.pop()

// extension of generic type
extension Stack {
    var topItem: Element?{
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("top item: \(topItem)")
}


func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated(){
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])

// Associated Types
protocol Container {
    //associatedtype Item: Equatable
    associatedtype Ebu
    mutating func append(_ item: Ebu)
    var count: Int { get }
    subscript(i: Int) -> Ebu { get }
}

struct IntStack: Container {
    
    typealias Item = Int
    var items = [Int]()
    
    
    
    mutating func push(_ item: Int){
        items.append(item)
    }
    
    mutating func pop() -> Int{
        return items.removeLast()
    }
    
    mutating func append(_ item: Int) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stack2<Element>: Container {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

// Extending existing types with associated values
extension Array : Container { }

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

//Associated Types Generics

//extension Stack2: SuffixableContainer {
//
//    func suffix(_ size: Int) -> Stack2 {
//        var result = Stack2()
//        for index in (count - size)..<count {
//            result.append(self[index])
//        }
//        return result
//    }
//}
//var stackOfInts = Stack2<Int>()
//stackOfInts.append(10)
//stackOfInts.append(20)
//stackOfInts.append(30)
//let suffix = stackOfInts.suffix(2)

//extension IntStack: SuffixableContainer {
//    func suffix(_ size: Int) -> Stack<Int> {
//        var result = Stack<Int>()
//        for index in (count-size)..<count {
//            result.append(self[index])
//        }
//        return result
//    }
//    // Inferred that Suffix is Stack<Int>.
//}

func allItemsMatch<C1: Container, C2: Container>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {

        if someContainer.count != anotherContainer.count {
            return false
        }

        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }

        return true
}

//var stackOfStrings2 = Stack2<String>()
//stackOfStrings.push("uno")
//stackOfStrings.push("dos")
//stackOfStrings.push("tres")
//
//var arrayOfStrings = ["uno", "dos", "tres"]
//
//if allItemsMatch(stackOfStrings2, arrayOfStrings) {
//    print("All items match.")
//} else {
//    print("Not all items match.")
//}

extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}
if stackOfStrings.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}

struct NotEquatable { }
var notEquatableStack = Stack<NotEquatable>()
let notEquatableValue = NotEquatable()
//notEquatableStack.push(notEquatableValue)
//notEquatableStack.isTop(notEquatableValue

extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}

if [9, 9, 9].startsWith(42) {
    print("Starts with 42.")
} else {
    print("Starts with something else.")
}

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}
print([1260.0, 1200.0, 98.6, 37.0].average())


extension Container {
    func average() -> Double where Item == Int {
        var sum = 0.0
        for index in 0..<count {
            sum += Double(self[index])
        }
        return sum / Double(count)
    }
    
    func endsWith(_ item: Item) -> Bool where Item: Equatable {
        return count >= 1 && self[count - 1] == item
    }
}

let numbers = [1260, 1200, 98, 37]
print(numbers.average())

print("end with 37: \(numbers.endsWith(37))")

extension Container where Item == Int {
    func average2() -> Double {
            var sum = 0.0
            for index in 0..<count {
                sum += Double(self[index])
            }
            return sum / Double(count)
        }
}

extension Container where Item: Equatable {
    func endsWith2(_ item: Item) -> Bool {
        return count >= 1 && self[count-1] == item
    }
}

protocol Container2 {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}

protocol ComparableContainer: Container2 where Item: Comparable { }

//Generic subscripts
extension Container2 {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
            where Indices.Iterator.Element == Int {
                var result = [Item]()
                for index in indices {
                    result.append(self[index])
                }
                return result
        }
}
