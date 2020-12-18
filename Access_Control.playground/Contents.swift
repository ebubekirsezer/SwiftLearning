

// Access control
//public class SomePublicClass {}
//internal class SomeInternalClass {}
//fileprivate class SomeFilePrivateClass {}
//private class SomePrivateClass {}
//
//public var somePublicVariable = 0
//internal let someInternalConstant = 0
//fileprivate func someFilePrivateFunction() {}
//private func somePrivateFunction() {}
//
//class SomeInternalClass2 {}              // implicitly internal
//let someInternalConstant2 = 0            // implicitly internal

public class SomePublicClass {
    public var somePublicProperty = 0
    var someInternalProperty = 0
    fileprivate func someFilePrivateMethod() {
        
    }
    private func somePrivateMethod(){
        
    }
}

class SomeInternalClass{
    var someInternalPropert = 0
    fileprivate func someFilePrivateMethod(){
        
    }
    private func somePrivateMethod(){
        
    }
}

fileprivate class someFilePrivateClass{
    func someFilePrivateMethod(){
        
    }
    private func somePrivateMethod(){
        
    }
}

private class SomePrivateClass{
    func somePrivateMethod(){
            
    }
}

//private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
//
//}

public enum CompassPoint{
    case north
    case south
    case east
    case west
}

public class A {
    fileprivate func someMethod(){
        
    }
}

internal class B: A{
    override internal func someMethod() {
        super.someMethod()
    }
}


private var privateInstance = SomePrivateClass()

struct TrackedString{
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet{
            numberOfEdits += 1
        }
    }
    
    public init() {
        
    }
}


var stringToEdit = TrackedString()
stringToEdit.value = "string1"
stringToEdit.value += " 2"
stringToEdit.value += " 3"
print("Number of edits: \(stringToEdit.numberOfEdits)")

protocol SomeProtocol{
    func doSomething()
}

struct SomeStruct{
    private var privateVariable = 12
}

extension SomeStruct: SomeProtocol{
    func doSomething() {
        print(privateVariable)
    }
}

var someStruct = SomeStruct()
someStruct.doSomething()
