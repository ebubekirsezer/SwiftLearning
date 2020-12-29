//
//  CitySource.swift
//  Countries
//
//  Created by Ebubekir Sezer on 26.12.2020.
//

import UIKit

class CitySource {
    
    static let westCities: [City] = [
        City(cityImage: #imageLiteral(resourceName: "istanbul"), cityName: "Istanbul"),
        City(cityImage: #imageLiteral(resourceName: "edirne"), cityName: "Edirne"),
        City(cityImage: #imageLiteral(resourceName: "sakarya"), cityName: "Sakarya"),
        City(cityImage: #imageLiteral(resourceName: "kocaeli"), cityName: "Kocaeli"),
    ]
    
    static let anatoliaCities: [City] = [
        City(cityImage: #imageLiteral(resourceName: "ankara"), cityName: "Ankara"),
        City(cityImage: #imageLiteral(resourceName: "sivas"), cityName: "Sivas"),
        City(cityImage: #imageLiteral(resourceName: "kayseri"), cityName: "Kayseri"),
        City(cityImage: #imageLiteral(resourceName: "konya"), cityName: "Konya"),
    ]
    
    static let eastCities: [City] = [
        City(cityImage: #imageLiteral(resourceName: "malatya"), cityName: "Malatya"),
        City(cityImage: #imageLiteral(resourceName: "erzurum"), cityName: "Erzurum"),
        City(cityImage: #imageLiteral(resourceName: "elazıg"), cityName: "Elazıg"),
        City(cityImage: #imageLiteral(resourceName: "adiyaman"), cityName: "Adıyaman"),
    ]
}
