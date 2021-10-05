
import UIKit

public protocol Theme {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}

public struct LightTheme: Theme {
    public var backgroundColor: UIColor = .white
    public var textColor: UIColor = .darkGray
    public init() { }
}

public struct DarkTheme: Theme {
    public var backgroundColor: UIColor = .darkGray
    public var textColor: UIColor = .white
    public init() { }
}

public struct BlueTheme: Theme {
    public var backgroundColor: UIColor = .blue
    public var textColor: UIColor = .white
    public init() { }
}

public struct MonochromeTheme: Theme {
    public var backgroundColor: UIColor = .black
    public var textColor: UIColor = .white
    public init() { }
}
