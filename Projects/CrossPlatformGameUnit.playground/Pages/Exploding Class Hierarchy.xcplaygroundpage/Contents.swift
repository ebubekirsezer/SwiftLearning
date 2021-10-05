import Foundation

struct Vec2D {
    var x, y: Double
}

protocol GameUnit {
    func move(to position: Vec2D)
    func look(at point: Vec2D)
}

struct PSUnit: GameUnit {
    init() {
        print("\(self) created")
    }
    
    func move(to position: Vec2D) {
        print("\t Moving to \(position)")
    }
    
    func look(at point: Vec2D) {
        print("\t Looking at \(point)")
    }
}

struct XboxUnit: GameUnit {
    init() {
        print("\(self) created")
    }
    
    func move(to position: Vec2D) {
        print("\t Moving to \(adjust(position))")
    }
    
    func look(at point: Vec2D) {
        print("\t Looking at \(adjust(point))")
    }
    
    private func adjust(_ v: Vec2D) -> Vec2D {
        Vec2D(x: v.x, y: -v.y)
    }
}

protocol Agent: GameUnit {
    func follow(path: [Vec2D])
}

struct PSAgent: Agent {
    init() {
        print("\(self) created")
    }
    
    func move(to position: Vec2D) {
        print("\t Moving to \(position)")
    }
    
    func look(at point: Vec2D) {
        print("\t Looking at \(point)")
    }
    
    func follow(path: [Vec2D]) {
        for pos in path {
            move(to: pos)
        }
    }
}

struct XboxAgent: Agent {
    init() {
        print("\(self) created")
    }
    
    func move(to position: Vec2D) {
        print("\t Moving to \(adjust(position))")
    }
    
    func look(at point: Vec2D) {
        print("\t Looking at \(adjust(point))")
    }
    
    func follow(path: [Vec2D]) {
        for pos in path {
            move(to: pos )
        }
    }
    
    private func adjust(_ v: Vec2D) -> Vec2D {
        Vec2D(x: v.x, y: -v.y)
    }
}

protocol NPC: GameUnit {
    func spawn(at point: Vec2D)
}

struct PSNPC: NPC {
    init() {
        print("\(self) created")
    }
    
    func move(to position: Vec2D) {
        print("\t Moving to \(position)")
    }
    
    func look(at point: Vec2D) {
        print("\t Looking at \(point)")
    }
    
    func spawn(at point: Vec2D) {
        print("\t Spawning at \(point)")
    }
}

struct XboxNPC: NPC {
    init() {
        print("\(self) created")
    }
    
    func move(to position: Vec2D) {
        print("\t Moving to \(adjust(position))")
    }
    
    func look(at point: Vec2D) {
        print("\t Looking at \(adjust(point))")
    }
    
    func spawn(at point: Vec2D) {
        print("\t Spawning at \(adjust(point))")
    }
    
    private func adjust(_ v: Vec2D) -> Vec2D {
        Vec2D(x: v.x, y: -v.y)
    }
}
