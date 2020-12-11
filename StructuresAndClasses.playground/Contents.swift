
//Definition of struct and class
struct SomeStruct{
    
}

class SomeClass{
    
}

struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print("some resolution width is \(someResolution.width)")

print("some video mode resolution width is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 64
print("chaged some video mode resolution widtth is \(someVideoMode.resolution.width)")

let vga = Resolution(width: 640, height: 480)

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

print("cinema is now \(cinema.width) pixels")
print("hd still \(hd.width) pixels")

//enum and struct value types, class reference type
// same situation make same in the enum
enum CompassPoint{
    case north, south, east, west
    mutating func turnNorth(){
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection

currentDirection.turnNorth()

print("current direction \(currentDirection)")
print("remembered direction \(rememberedDirection)")

// classes
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.frameRate = 25.0
tenEighty.name = "1080i"

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("frame rate propert of tenEight: \(tenEighty.frameRate)")

/*
 Burada class ları let olarak tanımlamışım fakat içindeki değerleri değiştirebiliyorum
 bunun nedeni class lar bir yere referans oldugunu bildiriyor içerisinde ki değeri
 saklamıyor !!
 */

/*
 Class lar referans tuttukaları için aynı yere referans yere tutup tutmadaıklarını ögrenebiliriz
 bunu Identity Operatorler ile yapıyoruz onlar === ve !== şeklinde
 */

if tenEighty === alsoTenEighty{
    print("they refer the same VideMode instance")
}


let ebu = VideoMode()

if ebu === tenEighty{
    print("same reference")
} else {
    print("not same reference")
}


// struct ve enum lar value type oldukları için == ve === gibi işlemler ile karşılaştıramayız.
