//
//  Characters.swift
//  StarWarsApp
//
//  Created by Ebubekir Sezer on 6.04.2021.
//

import Foundation

struct Characters: Codable {
    var count: Int
    var results: [StarWarsCharacter]
}
