//
//  MovieListPresenter.swift
//  MovieBoxVIPER
//
//  Created by Ebubekir Sezer on 27.06.2021.
//

import Foundation

final class MovieListPresenter: MovieListPresenterProtocol {
    
    private unowned let view: MovieListViewProtocol
    private let interactor: MovieListInteractorProtocol
    private let router: MovieListRouterProtocol
    
    init(view: MovieListViewProtocol, interactor: MovieListInteractorProtocol, router: MovieListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        self.interactor.delegate = self
    }
    
    func load() {
        // Update Title
        view.handleOutput(.updateTitle("Movies"))
        // Load Movies
        interactor.load()
    }
    
    func selectMovie(at index: Int) {
        interactor.selectMovie(at: index)
    }
}

extension MovieListPresenter: MovieListInteractorDelegate {
    
    func handleOutput(_ output: MovieListInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view.handleOutput(.setLoading(isLoading))
        case .showMovieList(let movies):
            let moviePresentations = movies.map(MoviePresentation.init)
            view.handleOutput(.showMovieList(moviePresentations))
        case .showMovieDetail(let movie):
            router.navigate(to: .detail(movie))
            
        }
    }
}
