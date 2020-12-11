
// Methods

class Counter{
    var count = 0
    
    func increment(){
        self.count += 1
    }
    
    func increment(by amount: Int){
        count += amount
    }
    
    func reset(){
        count = 0
    }
}

let counter = Counter()

counter.increment()
print(counter.count)

counter.increment(by: 6)

print(counter.count)

counter.reset()
print(counter.count)


struct Point{
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool{
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)

if somePoint.isToTheRightOf(x: 1.0){
    print("this point is to he right of the line where x = 1.0")
}

struct Point2{
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}

var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveBy(x: 2.0, y: 3.0)
print("the point is now \(somePoint2.x), \(somePoint2.y)")

let fixedPoint = Point2(x: 3.0, y: 3.0)
//fixedPoint.moveBy(x: 1.0, y: 1.0) throws error

struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
    
}

enum TriStateSwitch{
    case off, low, high
    mutating func next(){
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()

class SomeClass{
    class func someTypeMethod(){
        
    }
}

SomeClass.someTypeMethod()

struct LevelTracker{
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int){
        if level > highestUnlockedLevel { highestUnlockedLevel = level}
    }
    
    static func isUnlocked(_ level: Int) -> Bool{
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool{
        if LevelTracker.isUnlocked(level){
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player{
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int){
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Ebubekir")
player.complete(level: 1)
print("highest unlocked level \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6){
    print("player on the 6 level")
} else {
    print("level 6 not unlocked yet")
}
