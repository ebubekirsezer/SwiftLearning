import Foundation
import LaptopShop_Sources
import LaptopShop_PageSources

public protocol LaptopBuilder {
    var size: Size { get set}
    var processor: Processor { get set }
    var graphics: Graphics { get set }
    
    mutating func buildParts(configuration: [String: String])
    func getLaptop() -> Laptop
}

extension LaptopBuilder {
    
    mutating public func buildParts(configuration: [String: String]) {
        if let customSize = configuration["size"] {
            switch customSize {
            case "13-inch":
                self.size = .thirteenInch
            case "15-inch":
                self.size = .fifteenInch
            default:
                print("Unexpected Value")
            }
        }
        
        if let processor = configuration["processor"] {
            switch processor {
            case "i5":
                self.processor = .i5
            case "i7":
                self.processor = .i7
            case "i9":
                self.processor = .i9
            default:
                print("Unexpected Value")
            }
        }
        
        if let graphics = configuration["graphics"] {
            switch graphics {
            case "intel-uhd-graphics-617":
                self.graphics = .intelUHD617
            case "intel-iris-plus-graphics-645":
                self.graphics = .intelIrisPlus645
            case "radeon-pro-vega-20":
                self.graphics = .radeonProVega20
            default:
                print("Unexpected Value")
            }
        }
    }
    
    public func getLaptop() -> Laptop {
        return Laptop(size: size, processor: processor, graphics: graphics)
    }
}

public class BudgetLaptopBuilder: LaptopBuilder {
    public var size: Size = .thirteenInch
    public var processor: Processor = .i5
    public var graphics: Graphics = .intelUHD617

    public init() { }
}

public class OfficeLaptopBuilder: LaptopBuilder {
    public var size: Size = .fifteenInch
    public var processor: Processor = .i7
    public var graphics: Graphics = .intelIrisPlus645
    
    public init() { }
}

public class HighEndLaptopBuilder: LaptopBuilder {
    public var size: Size = .fifteenInch
    public var processor: Processor = .i9
    public var graphics: Graphics = .radeonProVega20
    
    public init() { }
}

public class Director {
    private var builder: LaptopBuilder?
    
    public init(builder: LaptopBuilder) {
        self.builder = builder
    }
    
    public func constructLaptop(configuration: [String: String]) {
        builder?.buildParts(configuration: configuration)
    }
}
