//
//  WeatherResult.swift
//  GoodWeather
//
//  Created by Ebubekir Sezer on 29.08.2021.
//

import Foundation

struct WeatherResult: Codable {
    let main: Weather?
}

extension WeatherResult {
    
    static var empty: WeatherResult {
        return WeatherResult(main: Weather(temp: 0, humidity: 0))
    }
}


struct Weather: Codable {
    let temp: Double?
    let humidity: Double
    
}
