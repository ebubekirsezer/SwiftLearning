//
//  Movie.swift
//  MovieBoxAPI
//
//  Created by Ebubekir Sezer on 14.04.2021.
//

import Foundation

public struct Movie: Decodable {
    
    public enum CodingKeys: String, CodingKey {
        case artistName
        case releaseDate
        case name
        case copyright
        case image = "artworkUrl100"
        case genres
    }
    
    public let artistName: String
    public let releaseDate: Date
    public let name: String
    public let copyright: String?
    public let image: String
    public let genres: [Genre ]
}

public struct Genre: Decodable {
    public let name: String
}
