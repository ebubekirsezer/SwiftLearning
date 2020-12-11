
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 5

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)

//rangeOfFourItems.firstValue = 5
// we can not chage the struct defined by the let because it's value type

// lazy

class DataImporter{
    var fileName = "data.txt"
}

class DataManager{
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

//importer property only created when its accessed
print(manager.importer.fileName)

// Computed Properties

struct Point{
    var x = 0.0, y = 0.0
}

struct Size{
    var width = 0.0, height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    var center: Point{
        get{
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.x + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.width / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square origin is now \(square.origin.x), \(square.origin.y)")


// if struct set value not determined it can be reached by the newValue
struct AlternativeRect{
    var origin = Point()
    var size = Size()
    var center: Point{
        get{
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set{
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// shorthand getter definition
struct CompactRent{
    var origin = Point()
    var size = Size()
    var center: Point{
        get{
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set{
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}


//Read-Only there is get but not set
struct Cuboid{
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double{
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4, height: 5, depth: 2)
print("the volume: \(fourByFiveByTwo.volume)")

//willset and didset
class StepCounter{
    var totalSteps: Int = 0{
        willSet(newTotalSteps){
            print("About to set total steps \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200

stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

// Property Wrapper
@propertyWrapper
struct TwelveOrLess{
    private var number: Int
    init() {
        self.number = 0
    }
    var wrappedValue : Int{
        get {return number}
        set { number = min(newValue, 12)}
    }
}

struct SmallRectangle{
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)

struct SmallRectangle2{
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int{
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue}
    }
    var width: Int{
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue}
    }
    
}


@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int{
        get { return number }
        set { number = min(newValue, maximum)}
    }
    
    init() {
        maximum = 12
        number = 0
    }
    
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle{
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)

struct UnitRectangle{
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)

struct NarrowRectangle{
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)

struct MixedRectangle{
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)

mixedRectangle.height = 20
print(mixedRectangle.height)

//projecting propert wrapper

@propertyWrapper
struct SmallNumber3{
    private var number: Int
    var projectedValue: Bool
    
    init() {
        self.number = 0
        self.projectedValue = false
    }
    
    var wrappedValue: Int{
        get { return number}
        set {
            if newValue > 12{
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}

struct MySmallNumber{
    @SmallNumber3 var someNumber: Int
}

var someStructure = MySmallNumber()

someStructure.someNumber = 4
print(someStructure.$someNumber)

someStructure.someNumber = 55
print(someStructure.$someNumber)

enum MySize {
    case small, large
}

struct SizedRectangle{
    @SmallNumber3 var height: Int
    @SmallNumber3 var width: Int
    
    mutating func resize(to size: MySize) -> Bool{
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}

struct SomeStruct2 {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int{
        return 1
    }
}

enum SomeEnum{
    static var storedProperty = "Some value."
    static var computedTypeProperty: Int{
        return 6
    }
}


class SomeClass2{
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int{
        return 27
    }
    
    class var ovverideableComputedTypePropery: Int {
        storedTypeProperty = "ebu"
        return 107
    }
}

print(SomeStruct2.storedTypeProperty)

SomeStruct2.storedTypeProperty = "another value"
print(SomeStruct2.storedTypeProperty)
print(SomeStruct2.computedTypeProperty)

print(SomeEnum.computedTypeProperty)
print(SomeClass2.computedTypeProperty)

struct AudioChannel{
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet{
            if currentLevel > AudioChannel.thresholdLevel{
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels{
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)

print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)

print(AudioChannel.maxInputLevelForAllChannels)
