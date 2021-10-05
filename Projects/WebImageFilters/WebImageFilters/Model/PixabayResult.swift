//
//  Result.swift
//  WebImageFilters
//
//  Created by Karoly Nyisztor on 1/26/21.
//

import Foundation

// Generated from JSON payload using CodableBot 0.1.1 - https://codablebot.launchaco.com
struct PixabayResult: Codable {

    let total: Double

    struct Hit: Codable {
        let imageHeight: Double
        let user: String
        let previewWidth: Double
        let imageWidth: Double
        let likes: Double
        let previewHeight: Double
        let webformatHeight: Double
        let tags: String
        let type: String
        let imageSize: Double
        let largeImageURL: String
        let downloads: Double
        let webformatURL: String
        let views: Double
        let id: Double
        let webformatWidth: Double
        let pageURL: String
        let previewURL: String
        let comments: Double
        let userId: Double
        let userImageURL: String

        enum CodingKeys: String, CodingKey {

            case userId = "user_id"
            case imageHeight
            case user
            case previewWidth
            case imageWidth
            case likes
            case previewHeight
            case webformatHeight
            case tags
            case type
            case imageSize
            case largeImageURL
            case downloads
            case webformatURL
            case views
            case id
            case webformatWidth
            case pageURL
            case previewURL
            case comments
            case userImageURL
        }
    
    }

    let hits: [Hit]
    let totalHits: Double
    
    enum CodingKeys: String, CodingKey {
        case hits
        case totalHits
        case total
    }
}
