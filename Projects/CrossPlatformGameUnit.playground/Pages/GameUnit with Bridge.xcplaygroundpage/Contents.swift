
import Foundation

struct Vec2D {
    var x, y: Double
}

protocol GameUnit {
    var imp: GameUnitImpl { get }
    func move(to position: Vec2D)
    func look(at point: Vec2D)
}

protocol GameUnitImpl {
    func move(to position: Vec2D)
    func look(at point: Vec2D)
    func spawn(at position: Vec2D)
}

struct PSUnit: GameUnitImpl {
    func move(to position: Vec2D) {
        print("\t Moving to \(position)")
    }
    
    func look(at point: Vec2D) {
        print("\t Looking at \(point)")
    }
    
    func spawn(at position: Vec2D) {
        print("\t Spawning at \(position)")
    }
}

struct XboxUnit: GameUnitImpl {
    func move(to position: Vec2D) {
        print("\t Moving to \(adjust(position))")
    }
    
    func look(at point: Vec2D) {
        print("\t Looking at \(adjust(point))")
    }
    
    func spawn(at position: Vec2D) {
        print("\t Spawning at \(adjust(position))")
    }
    
    private func adjust(_ v: Vec2D) -> Vec2D {
        Vec2D(x: v.x, y: -v.y)
    }
}

enum Platform: CustomStringConvertible {
    case xbox
    case ps
    
    var description: String {
        self == .xbox ? "Xbox" : "PlayStation"
    }
}

struct GameUnitSystemFactory {
    static var platform: Platform = .ps
    static func makeUnit() -> GameUnitImpl {
        platform == .xbox ? XboxUnit() : PSUnit()
    }
}

extension GameUnit {
    var imp: GameUnitImpl {
        GameUnitSystemFactory.makeUnit()
    }
    
    func move(to position: Vec2D) {
        imp.move(to: position)
    }
    
    func look(at point: Vec2D) {
        imp.look(at: point )
    }
}

struct PlayerControlled: GameUnit {
    init() {
        print("\(GameUnitSystemFactory.platform): \(self) unit created")
    }
}

struct Agent: GameUnit {
    init() {
        print("\(GameUnitSystemFactory.platform): \(self) unit created")
    }
    
    func follow(path: [Vec2D]) {
        for pos in path {
            imp.move(to: pos)
        }
    }
}


struct NPC: GameUnit {
    init() {
        print("\(GameUnitSystemFactory.platform): \(self) unit created")
    }
    
    func spawn(at position: Vec2D) {
        imp.spawn(at: position)
    }
}

GameUnitSystemFactory.platform = .xbox
let gameUnit = PlayerControlled()
gameUnit.move(to: Vec2D(x: 10, y: 0))

let agent = Agent()
agent.move(to: Vec2D(x: 100, y: 20))
agent.look(at: Vec2D(x: 1, y: 0))
agent.follow(path: [Vec2D(x: 10, y: 10), Vec2D(x: 15, y: 42)])

GameUnitSystemFactory.platform = .ps
let psAgent = Agent()
psAgent.look(at: Vec2D(x: 1, y: 1))

let npcUnit = NPC()
npcUnit.spawn(at: Vec2D(x: 100, y: 0))
