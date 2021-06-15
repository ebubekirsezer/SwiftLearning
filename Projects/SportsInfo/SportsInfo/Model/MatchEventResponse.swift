//
//  MatchEvent.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 18.01.2021.
//

import Foundation

struct MatchEventResponse: Decodable {
    let events: [Event]
}

