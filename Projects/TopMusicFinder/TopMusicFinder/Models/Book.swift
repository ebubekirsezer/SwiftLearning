//
//  Book.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 14.01.2021.
//

import Foundation

struct Book: Decodable {
    let artistName: String
    let releaseDate: String
    let name: String
    let artworkUrl100: String
}
