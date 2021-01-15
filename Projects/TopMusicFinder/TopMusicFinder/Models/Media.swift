//
//  Media.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 14.01.2021.
//

import Foundation

struct Media: Decodable {
    let name: String?
    let artistName: String?
    let artworkUrl100: String?
    let releaseDate: String?
    let collectionName: String?
}
