//: [Previous](@previous)

import Foundation

enum TemperatureUnit {
    case celsius
    case fahrenheit
}

enum SpeedUnit {
    case kilometers
    case miles
}

protocol SpeedSettingsProtocol: AnyObject {
    var speedUnit: SpeedUnit { get set }
}

protocol TemperatureSettingsProtocol: AnyObject {
    var temperatureUnit: TemperatureUnit { get set }
}

class TemperatureController {
    
    private let settings: TemperatureSettingsProtocol
    
    init(settings: TemperatureSettingsProtocol) {
        self.settings = settings
    }
    
    func toggle() {
        switch settings.temperatureUnit {
        case .celsius:
            settings.temperatureUnit = .fahrenheit
        case .fahrenheit:
            settings.temperatureUnit = .celsius
        }
    }
}
