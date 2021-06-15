//
//  Event.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 21.01.2021.
//

import Foundation

struct Event: Decodable {
    var idEvent: String?
    var strEvent: String?
    var strSport: String?
    var strLeague: String?
    var strSeason: String?
    var strHomeTeam: String?
    var strAwayTeam: String?
    var intHomeScore: String?
    var intRound: String?
    var intAwayScore: String?
    var dateEvent: String?
    var strVenue: String?
    var strCountry: String?
    var strThumb: String?
    var strStatus: String?
}
