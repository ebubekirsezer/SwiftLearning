public protocol ThemeCreator {
    static func makeTheme(profile: ColorProfile) -> Theme
}

public enum ColorProfile {
    case light
    case dark
    case blue
    case mono
}

extension ThemeCreator {
    static public func makeTheme(profile: ColorProfile) -> Theme {
        switch profile {
        case .light:
            return LightTheme()
        case .dark:
            return DarkTheme()
        case .blue:
            return BlueTheme()
        case .mono:
            return MonochromeTheme()
        }
    }
}

public class MyThemeCreator: ThemeCreator { }
