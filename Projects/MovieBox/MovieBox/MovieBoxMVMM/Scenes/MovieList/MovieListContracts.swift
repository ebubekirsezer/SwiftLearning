//
//  MovieListContracts.swift
//  MovieBoxMVMM
//
//  Created by Ebubekir Sezer on 12.06.2021.
//

import Foundation


protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    func load()
    func selectMovie(at index: Int)
}

enum MovieListViewModelOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList([MoviePresentation])
}

enum MovieListViewRoute {
    case detail(MovieDetailViewModelProtocol)
}

protocol MovieListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
    func navigate(to route: MovieListViewRoute)
}
