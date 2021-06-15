//
//  Player.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 21.01.2021.
//

import Foundation

struct Player: Decodable {
    var idPlayer: String?
    var strNationality: String?
    var strPlayer: String?
    var strTeam: String?
    var strSport: String?
    var dateBorn: String?
    var strDescriptionEN: String?
    var strPosition: String?
    var strSide: String?
    var strCutout: String?
    var strBanner: String?
}
