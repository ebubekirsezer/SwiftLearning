import Foundation

public protocol WeatherService {
    var backupService: WeatherService? { get }
    init(backupService: WeatherService?)
    func fetchCurrentWeather(city: String, countryCode: String, completionHandler: (WeatherData?, WeatherServiceError?) -> Void)
}

public struct WeatherData {
    public let city: String
    public let countryCode: String
    public let weather: String
    public let temp: Float
    public let unit: TempUnit
}

public enum TempUnit {
    case scientific
    case metric
    case imperial
}

extension TempUnit: CustomStringConvertible {
    public var description: String {
        switch self {
        case .scientific:
            return "Kelvin"
        case .metric:
            return "Celsius"
        case .imperial:
            return "Fahrenheit"
        }
    }
}

extension WeatherService {
    public var backupService: WeatherService? {
        return nil
    }
}

public enum WeatherServiceError: Error {
    case serviceDown
    case noData
    case unknown
}

extension WeatherServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .serviceDown:
            return "Service unavailable"
        case .noData:
            return "Could not retrieve weather data"
        case .unknown:
            return "Unknown error occured"
        }
    }
}

fileprivate struct OpenWeatherService: WeatherService, CustomStringConvertible {
    fileprivate var backupService: WeatherService?
    
    init(backupService: WeatherService? = nil) {
        self.backupService = backupService
    }
    
    func fetchCurrentWeather(city: String, countryCode: String, completionHandler: (WeatherData?, WeatherServiceError?) -> Void) {
        guard self.hasError() == nil else {
            if let backupService = self.backupService {
                let error = self.hasError() ?? .unknown
                print("\(self) could not fetch weather data, Reason: \(error.localizedDescription)")
                print("\t Falling back to \(backupService)")
                
                backupService.fetchCurrentWeather(city: city, countryCode: countryCode, completionHandler: completionHandler)
            } else {
                print("Backup service not set. Reached the end of the fallback chain\n")
                completionHandler(nil, self.hasError())
            }
            return
        }
        
        print("Weather data successfully fetched using \(self)")
        completionHandler(WeatherData(city: city, countryCode: countryCode, weather: "Clear", temp: 72, unit: .imperial), nil)
    }
    
    var description: String {
        return "OpenWeatherService"
    }
    
    fileprivate func hasError() -> WeatherServiceError? {
        return .serviceDown
    }
}


fileprivate struct AccuWeatherService: WeatherService, CustomStringConvertible {
    fileprivate var backupService: WeatherService?
    
    init(backupService: WeatherService? = nil) {
        self.backupService = backupService
    }
    
    func fetchCurrentWeather(city: String, countryCode: String, completionHandler: (WeatherData?, WeatherServiceError?) -> Void) {
        guard self.hasError() == nil else {
            if let backupService = self.backupService {
                let error = self.hasError() ?? .unknown
                print("\(self) could not fetch weather data, Reason: \(error.localizedDescription)")
                print("\t Falling back to \(backupService)")
                
                backupService.fetchCurrentWeather(city: city, countryCode: countryCode, completionHandler: completionHandler)
            } else {
                print("Backup service not set. Reached the end of the fallback chain\n")
                completionHandler(nil, self.hasError())
            }
            return
        }
        
        print("Weather data successfully fetched using \(self)")
        completionHandler(WeatherData(city: city, countryCode: countryCode, weather: "Clear", temp: 72, unit: .imperial), nil)
    }
    
    var description: String {
        return "AccuWeatherService"
    }
    
    fileprivate func hasError() -> WeatherServiceError? {
        return .noData
    }
}

fileprivate struct DarkSkyWeatherService: WeatherService, CustomStringConvertible {
    fileprivate var backupService: WeatherService?
    
    init(backupService: WeatherService? = nil) {
        self.backupService = backupService
    }
    
    func fetchCurrentWeather(city: String, countryCode: String, completionHandler: (WeatherData?, WeatherServiceError?) -> Void) {
        guard self.hasError() == nil else {
            if let backupService = self.backupService {
                let error = self.hasError() ?? .unknown
                print("\(self) could not fetch weather data, Reason: \(error.localizedDescription)")
                print("\t Falling back to \(backupService)")
                
                backupService.fetchCurrentWeather(city: city, countryCode: countryCode, completionHandler: completionHandler)
            } else {
                print("Backup service not set. Reached the end of the fallback chain\n")
                completionHandler(nil, self.hasError())
            }
            return
        }
        
        print("Weather data successfully fetched using \(self)")
        completionHandler(WeatherData(city: city, countryCode: countryCode, weather: "Clear", temp: 72, unit: .imperial), nil)
    }
    
    var description: String {
        return "DarkSky"
    }
    
    fileprivate func hasError() -> WeatherServiceError? {
        return nil
    }
}

public struct WeatherServiceWrapper: WeatherService {
    public init(backupService: WeatherService? = nil) {
        
    }
    
    public func fetchCurrentWeather(city: String, countryCode: String, completionHandler: (WeatherData?, WeatherServiceError?) -> Void) {
        let darkSkyService = DarkSkyWeatherService()
        let accuWeatherService = AccuWeatherService(backupService: darkSkyService)
        let openWeatherService = OpenWeatherService(backupService: accuWeatherService)
        
        openWeatherService.fetchCurrentWeather(city: city, countryCode: countryCode) { (weatherData, error) in
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            completionHandler(weatherData, nil)
        }
    }
}

let weatherService = WeatherServiceWrapper()
weatherService.fetchCurrentWeather(city: "San Fransisco", countryCode: "US") { (weatherData, error) in
    guard error == nil else {
        print("Error while retrieving weather data: \(error?.localizedDescription ?? "")")
        return
    }
    
    print(weatherData ?? "No weather data")
}
