//
//  URL+Extension.swift
//  GoodWeather
//
//  Created by Ebubekir Sezer on 29.08.2021.
//

import Foundation


extension URL {
    
    static func urlForWeatherAPI(city: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=a47ba772a9d696a506e4c8daba6ac676")
    }
}
