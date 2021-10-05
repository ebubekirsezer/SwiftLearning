//
//  MovieTests.swift
//  MovieBoxAPITests
//
//  Created by Ebubekir Sezer on 15.04.2021.
//

import XCTest
@testable import MovieBoxAPI

class MovieTests: XCTestCase {

    func testParsing() throws {
        let bundle = Bundle(for: MovieTests.self)
        let url = bundle.url(forResource: "movie", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let movie = try decoder.decode(Movie.self, from: data)
        print(movie)
        
        XCTAssertEqual(movie.artistName, "Brad Furman")
        XCTAssertEqual(movie.name, "City of Lies")
        XCTAssertEqual(movie.genres.count, 1)
        XCTAssertEqual(movie.genres.first?.name, "Thriller")
    }
}
