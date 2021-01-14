//
//  BookFeed.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 14.01.2021.
//

import Foundation

struct BookFeed: Decodable {
    let title: String
    let country: String
    let results: [Book]
}
