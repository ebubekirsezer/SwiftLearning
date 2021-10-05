import UIKit
import PlaygroundSupport

public final class GameScene {
    private var score: UInt
    private var progress: Float
    private var sessionTime: TimeInterval
    
    lazy private var sessionTimer = Timer.init(timeInterval: 1, repeats: true) { timer in
        self.sessionTime += timer.timeInterval
    }
    
    public init() {
        self.score = 0
        self.progress = 0
        self.sessionTime = 0
    }
    
    public func start() {
        RunLoop.current.add(sessionTimer, forMode: .default)
        sessionTimer.fire()
    }
    
    public var levelScore: UInt {
        get {
            return score
        }
        set {
            score = newValue
        }
    }
    
    public var levelProgress: Float {
        get{
            return progress
        }
        set {
            progress = newValue <= 100 ? newValue : 100
        }
    }
}

extension GameScene: CustomStringConvertible {
    public var description: String {
        return "Level progress \(progress), player score: \(score). Play time \(sessionTime) seconds"
    }
}

protocol Memento {
    associatedtype State
    var state: State { get set }
}

protocol Originator {
    associatedtype M: Memento
    func createMemento() -> M
    mutating func apply(memento: M)
}


protocol CareTaker {
    associatedtype O: Originator
    func saveState(originator: O, identifier: AnyHashable)
    func restoreState(originator: O, identifier: AnyHashable)
}

struct GameMemento: Memento {
    var state: ExternalGameState
}

struct ExternalGameState {
    var playScore: UInt
    var levelProgress: Float
}

extension GameScene: Originator {
    func createMemento() -> GameMemento {
        let currentState = ExternalGameState(playScore: score, levelProgress: progress)
        return GameMemento(state: currentState)
    }
    
    func apply(memento: GameMemento) {
        let restoreState = memento.state
        score = restoreState.playScore
        progress = restoreState.levelProgress
    }
}

public final class GameSceneManager: CareTaker {
    private lazy var snapshots = [AnyHashable: GameMemento]()
    
    func saveState(originator: GameScene, identifier: AnyHashable) {
        let snapshot = originator.createMemento()
        snapshots[identifier] = snapshot
    }
    
    func restoreState(originator: GameScene, identifier: AnyHashable) {
        if let snapshot = snapshots[identifier] {
            originator.apply(memento: snapshot)
        }
    }
    
    public init() {}
}

let gameScene = GameScene()
gameScene.start()

let sceneManager = GameSceneManager()
sceneManager.saveState(originator: gameScene, identifier: "initial")
print(gameScene)

DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
    gameScene.levelProgress = 55
    gameScene.levelScore = 2500
    
    sceneManager.saveState(originator: gameScene, identifier: "snapshot_1")
    print(gameScene)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
        gameScene.levelProgress = 80
        gameScene.levelScore = 10000
        
        sceneManager.saveState(originator: gameScene, identifier: "snapshot_2")
        print(gameScene)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            sceneManager.restoreState(originator: gameScene, identifier: "initial")
            print("\nRestoring \"initial\"")
            print(gameScene)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                sceneManager.restoreState(originator: gameScene, identifier: "snapshot_2")
                print("\nRestoring \"snapshot_2\"")
                print(gameScene)
                
                PlaygroundPage.current.finishExecution()
            }
        }
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true
