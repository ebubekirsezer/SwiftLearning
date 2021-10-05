//
//  MovieListInteractor.swift
//  MovieBoxVIPER
//
//  Created by Ebubekir Sezer on 27.06.2021.
//

import Foundation
import MovieBoxAPI

final class MovieListInteractor: MovieListInteractorProtocol {
    
    var delegate: MovieListInteractorDelegate?
    
    private let service: TopmoviesServiceProtocol
    private var movies: [Movie] = []
    
    init(service: TopmoviesServiceProtocol) {
        self.service = service
    }
    
    func load() {
        delegate?.handleOutput(.setLoading(true))
        service.fetchTopMovies { [weak self] result in
            guard let self = self else { return }
            self.delegate?.handleOutput(.setLoading(false))
            
            switch result {
            case .success(let value):
                self.movies = value.results
                self.delegate?.handleOutput(.showMovieList(value.results))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectMovie(at index: Int) {
        let movie = movies[index]
        delegate?.handleOutput(.showMovieDetail(movie))
    }
}
