import Foundation

public class ComputerFactory {
    public func chooseFinish() -> Finish? {
        return nil
    }
    
    public func chooseProcessor() -> Processor? {
        return nil
    }
    
    public func chooseGraphics() -> Graphics? {
        return nil
    }
    
    public final class func makeFactory(type: ComputerType) -> ComputerFactory {
        var factory: ComputerFactory
        
        switch type {
        case .office:
            factory = OfficeComputerFactory()
        case .highEnd:
            factory = HighEndComputerFactory()
        }
        return factory
    }
}

public enum ComputerType {
    case office
    case highEnd
}


private class OfficeComputerFactory: ComputerFactory {
    override func chooseFinish() -> Finish? {
        return Silver()
    }
    
    override func chooseProcessor() -> Processor? {
        return Fast()
    }
    
    override func chooseGraphics() -> Graphics? {
        return Standart()
    }
}

private class HighEndComputerFactory: ComputerFactory {
    override func chooseFinish() -> Finish? {
        return SpaceGray()
    }
    
    override func chooseProcessor() -> Processor? {
        return Turbo()
    }
    
    override func chooseGraphics() -> Graphics? {
        return Ultra()
    }
}
