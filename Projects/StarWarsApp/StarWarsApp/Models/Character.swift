//
//  Character.swift
//  StarWarsApp
//
//  Created by Ebubekir Sezer on 6.04.2021.
//

import Foundation

struct StarWarsCharacter: Codable {
    var name: String
    var height: String
    var birthYear: String
    var gender: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case birthYear = "birth_year"
        case gender
    }
}
