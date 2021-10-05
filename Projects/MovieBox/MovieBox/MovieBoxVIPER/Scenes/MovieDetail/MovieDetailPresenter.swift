//
//  MovieDetailPresenter.swift
//  MovieBoxVIPER
//
//  Created by Ebubekir Sezer on 30.06.2021.
//

import Foundation
import struct MovieBoxAPI.Movie

final class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    unowned var view: MovieDetailViewProtocol
    private let movie: Movie
    
    init(view: MovieDetailViewProtocol, movie: Movie) {
        self.view = view
        self.movie = movie
    }
    
    func load() {
        view.update(MovieDetailPresentation(movie: movie))
    }
}
