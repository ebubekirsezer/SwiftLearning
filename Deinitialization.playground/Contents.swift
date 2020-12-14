
// Deinitiazlization only work for the class types

class Bank{
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int{
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int){
        coinsInBank += coins
    }
}

class Player{
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("new player coins: \(playerOne!.coinsInPurse)")
print("In the bank that much coins left: \(Bank.coinsInBank)")

playerOne!.win(coins: 2000)
print("winnig price: \(playerOne!.coinsInPurse)")
print("In the bank that much coins left: \(Bank.coinsInBank)")

playerOne = nil
print("player left the game")
print("bank has \(Bank.coinsInBank) coins")
