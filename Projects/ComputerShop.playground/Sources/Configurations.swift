import Foundation

//Finish
public protocol Finish: CustomStringConvertible {
    var color: String { get }
    var price: Int { get }
}

extension Finish {
    public var description: String {
        return "\(color)"
    }
}

public struct Silver: Finish {
    public var color: String = "silver"
    public var price: Int = 200
    public init() { }
}

public struct SpaceGray: Finish {
    public var color: String = "space gray"
    public var price: Int = 300
    public init() { }
}

//Processor
public protocol Processor: CustomStringConvertible {
    var type: String { get }
    var price: Int { get }
}

extension Processor {
    public var description: String {
        return "\(type)"
    }
}

public struct Fast: Processor {
    public var type: String = "fast"
    public var price: Int = 300
    public init() { }
}

public struct Turbo: Processor {
    public var type: String = "turbo"
    public var price: Int = 500
    public init() { }
}

//Graphics
public protocol Graphics: CustomStringConvertible {
    var card: String { get }
    var price: Int { get }
}

extension Graphics {
    public var description: String {
        return "\(card)"
    }
}

public struct Standart: Graphics {
    public var card: String = "standart"
    public var price: Int = 400
    public init() { }
}

public struct Ultra: Graphics {
    public var card: String = "ultra"
    public var price: Int = 600
    public init() { }
}
