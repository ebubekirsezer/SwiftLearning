//
//  MovieDetailViewModel.swift
//  MovieBoxMVMM
//
//  Created by Ebubekir Sezer on 12.06.2021.
//

import Foundation
import MovieBoxAPI

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate?
    
    private var presentation: MovieDetailPresentation
    
    init(movie: Movie) {
        self.presentation = MovieDetailPresentation(title: movie.name, artistName: movie.artistName, genre: movie.genres.first?.name ?? "Not Found")
    }
    
    func load() {
        delegate?.showDetail(presentation)
    }
}
