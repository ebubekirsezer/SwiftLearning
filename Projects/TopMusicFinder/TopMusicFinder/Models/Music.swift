//
//  Music.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 12.01.2021.
//

import Foundation

struct Music: Decodable {
    let artistName: String
    let releaseDate: String
    let name: String
    let collectionName: String
    let artistUrl: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
}
