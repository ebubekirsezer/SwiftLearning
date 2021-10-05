import UIKit

struct Point {
    var x: Int
    var y: Int
}

var p1 = Point(x: 0, y: 0)
var p2 = p1

p2.x = 43
p2.y = 32

print("P1: \(p1), \nP2: \(p2)")
