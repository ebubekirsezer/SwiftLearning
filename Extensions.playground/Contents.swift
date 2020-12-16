
/*
 Extensions make the classes, structs, enumeration or protocol to have more feature
 */

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4 .mm
print("one inch: \(oneInch)")

let threeFeet = 3.0 .ft
print("3 feet: \(threeFeet)")

let aMarathon = 42.0 .km + 195 .m
print("A marathon is \(aMarathon) meter")

/*
 Extensions can not call designated init so for that we need to use convenience intiliazers
 */

struct Size{
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

/*
 In the below example we init the extension but after that we called the self.init
 */
extension Rect{
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

// Methods can be added with the extensions
extension Int{
    func repetitions(task: () -> Void){
        for _ in 0..<self{
            task()
        }
    }
}

3.repetitions {
    print("Hello Ebubekir")
}

// mutating instance with extension
extension Int{
    mutating func square(){
        self = self * self
    }
}

var someInt = 3
someInt.square()

//Subscripts can be add with extension
extension Int{
    subscript(digitIndex: Int) -> Int{
        var decimalBase = 1
        for _ in 0..<digitIndex{
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

15[0]
15[1]

665544[3]

//nested types can be added wiht extensiobs
extension Int{
    enum Kind{
        case negative, zero, positive
    }
    
    var kind: Kind{
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}


func printIntegerKinds(_ numbers: [Int]){
    for number in numbers{
        switch number.kind {
        case .negative:
            print("negative")
        case .positive:
            print("positive")
        case .zero:
            print("zero")
        }
    }
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
