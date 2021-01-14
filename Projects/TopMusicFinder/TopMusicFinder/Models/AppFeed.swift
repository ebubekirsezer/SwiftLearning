//
//  AppFeed.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 13.01.2021.
//

import Foundation

struct AppFeed: Decodable {
    let title: String?
    let country: String?
    let results: [App]?
}
