//
//  TopMoviesResponse.swift
//  MovieBoxAPI
//
//  Created by Ebubekir Sezer on 15.04.2021.
//

import Foundation

public struct TopMoviesResponse: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case feed
    }
    
    private enum FeedCodingKeys: String, CodingKey {
        case results
    }
    
    public let results: [Movie]
    
    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let feedContainer = try rootContainer.nestedContainer(keyedBy: FeedCodingKeys.self, forKey: .feed)
        self.results = try feedContainer.decode([Movie].self, forKey: .results)
    }
}
