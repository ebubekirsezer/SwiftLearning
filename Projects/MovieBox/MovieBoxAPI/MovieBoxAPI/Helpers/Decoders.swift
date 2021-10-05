//
//  Decoders.swift
//  MovieBoxAPI
//
//  Created by Ebubekir Sezer on 15.04.2021.
//

import Foundation

public enum Decoders {
    static let plainDateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
