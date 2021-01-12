//
//  MusicFeed.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 12.01.2021.
//

import Foundation

struct MusicFeed: Decodable {
    let title: String
    let country: String
    let results: [Music]
}
