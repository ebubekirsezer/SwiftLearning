

// Bitwise not operator ~
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits

//Bitwise and operator &
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits

//Bitwise or operator |
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedBits = someBits | moreBits

//Bitwise Xor operator ^
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits

//Shifting
let shiftBits: UInt8 = 4 // 00000100
shiftBits << 1 // 00001000
shiftBits << 2 // 00010000
shiftBits << 5 // 10000000
shiftBits << 6 // 00000000
shiftBits >> 2 // 00000001

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16
let greenComponent = (pink & 0x00FF00) >> 8
let blueComponent = pink & 0x0000FF

//Overflow operators
var potentialOverflow = Int16.max
//potentialOverflow += 1

var unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &+ 1

// &+ overflow addition &- overflow subtraction &* overflow multiplication

var unsignedOverflow2 = UInt8.min
unsignedOverflow2 = unsignedOverflow2 &- 1


//Operator Methods
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D{
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D{
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative

extension Vector2D{
    static func += (left: inout Vector2D, right: Vector2D){
        left = left + right
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)

if twoThree == anotherTwoThree {
    print("They are equal")
} else {
    print("They are not equal")
}

prefix operator +++
extension Vector2D{
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled

infix operator +-: AdditionPrecedence
extension Vector2D{
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D{
        return Vector2D(x: left.x + right.x , y: left.y - right.y)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
