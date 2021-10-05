//
//  Constants.swift
//  SpaceXApp
//
//  Created by Ebubekir Sezer on 2.04.2021.
//

import Foundation

struct Constants {
    static let baseUrl = "https://api.spacexdata.com/v3"
}

enum HttpHeaderField: String {
    case contentType = "Content-Type"
}

enum ContentType: String {
    case json = "application/json"
}
