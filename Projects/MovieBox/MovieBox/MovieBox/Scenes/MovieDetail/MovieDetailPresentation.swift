//
//  MovieDetailPresentation.swift
//  MovieBox
//
//  Created by Ebubekir Sezer on 9.06.2021.
//

import Foundation
import MovieBoxAPI

struct MovieDetailPresentation {
    let title: String
    let artistName: String
    let genre: String
}

extension MovieDetailPresentation {
    init(movie: Movie) {
        self.init(title: movie.name, artistName: movie.artistName, genre: movie.genres.map({ $0.name }).joined(separator: ", "))
    }
}
