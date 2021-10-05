//
//  MovieListContracts.swift
//  MovieBoxVIPER
//
//  Created by Ebubekir Sezer on 27.06.2021.
//

import Foundation
import struct MovieBoxAPI.Movie

//MARK: Interactor

protocol MovieListInteractorProtocol: AnyObject {
    var delegate: MovieListInteractorDelegate? { get set }
    func load()
    func selectMovie(at index: Int)
}
 
enum MovieListInteractorOutput {
    case setLoading(Bool)
    case showMovieList([Movie])
    case showMovieDetail(Movie)
}

protocol MovieListInteractorDelegate {
    func handleOutput(_ output: MovieListInteractorOutput)
}

//MARK: Presenter

protocol MovieListPresenterProtocol: AnyObject {
    func load()
    func selectMovie(at index: Int)
}

enum MovieListPresenterOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList([MoviePresentation])
}

//MARK: View

protocol MovieListViewProtocol: AnyObject {
    func handleOutput(_ output: MovieListPresenterOutput)
}

//MARK: Router

enum MovieListRoute {
    case detail(Movie)
}

protocol MovieListRouterProtocol: AnyObject {
    func navigate(to route: MovieListRoute)
}
