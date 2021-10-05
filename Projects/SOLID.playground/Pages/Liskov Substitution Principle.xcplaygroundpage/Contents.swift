//: [Previous](@previous)

import Foundation

protocol BirdProtocol {
    func walk()
}

protocol FlyingProtocol {
    func fly()
}

protocol FlyingBirdProtocol: BirdProtocol, FlyingProtocol {
    
}

class Eagle: FlyingBirdProtocol {
    
    func walk() {
        print("Eagle walking")
    }
    
    func fly() {
        print("Eagle flying")
    }
}

class Penguin: BirdProtocol {
    
    func walk() {
        print("Penguin walking")
    }
}

class Zoo {
    let birds: [FlyingBirdProtocol]
    
    init(birds: [FlyingBirdProtocol]) {
        self.birds = birds
    }
    
    func makeNoise() {
        for bird in birds {
            bird.fly()
        }
    }
}
