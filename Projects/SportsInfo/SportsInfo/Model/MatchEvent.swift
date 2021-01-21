//
//  MatchEvent.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 18.01.2021.
//

import Foundation

struct MatchEvent: Decodable {
    let events: [[String: String?]]
}

