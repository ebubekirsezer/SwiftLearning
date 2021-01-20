//
//  Constants.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 18.01.2021.
//

import Foundation

struct Constants {
    static let BASE_URL = "https://www.thesportsdb.com/api/v1/json/1/"
    
    struct EventInfo {
        static let eventID = "idEvent"
        static let eventLeagueID = "idLeague"
        static let eventSeason = "strSeason"
        static let eventImage = "strThumb"
        static let eventType = "strSport"
        static let eventLeague = "strLeague"
        static let eventHomeTeam = "strHomeTeam"
        static let eventAwayTeam = "strAwayTeam"
        static let eventHomeScore = "intHomeScore"
        static let eventAwayScore = "intAwayScore"
        static let eventRound = "intRound"
        static let eventDate = "dateEvent"
        static let eventStadium = "strVenue"
        static let eventCountry = "strCountry"
        static let eventStatus = "strStatus"
        static let eventBadge = "strBadge"
        static let teamBadge = "strTeamBadge"
        static let teamJersey = "strTeamJersey"
        static let teamName = "strTeam"
        static let teamDescription = "strDescriptionEN"
        static let teamStadium = "strStadium"
    }
}
