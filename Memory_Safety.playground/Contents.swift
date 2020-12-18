

func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)

//conflicting access to inout parameters

//// Error
var stepSize = 1


func increment(_ number: inout Int) {
    number += stepSize
}

//increment(&stepSize)
var copyOfStepSize = stepSize
increment(&copyOfStepSize)


func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)
//Error
//balance(&playerOneScore, &playerOneScore)

// Conflicting access to methods
struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth(){
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player){
        balance(&teammate.health, &health)
    }
}

var ebubekir = Player(name: "Ebubekir", health: 10, energy: 10)
var sezer = Player(name: "Sezer", health: 5, energy: 10)
ebubekir.shareHealth(with: &sezer)

//error
//ebubekir.shareHealth(with: &ebubekir)

var playerInformation = (health: 10, energy: 20)
//balance(&playerInformation.health, &playerInformation.energy)

var holly = Player(name: "Holly", health: 10, energy: 20)
//balance(&holly.health, &holly.energy)

func someFunction(){
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)
}
