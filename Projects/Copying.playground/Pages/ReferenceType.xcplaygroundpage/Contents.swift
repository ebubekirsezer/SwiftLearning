import UIKit

class Point {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

extension Point: CustomStringConvertible {
    var description: String {
        return "Point (\(x), \(y))"
    }
}

extension Point: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return Point(x: self.x, y: self.y)
    }
}

var p1 = Point(x: 0, y: 0)
var p2 = p1.copy() as! Point

p2.x = 43
p2.y = 32

print("P1: \(p1), \nP2: \(p2)")
