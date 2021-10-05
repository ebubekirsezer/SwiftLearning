//
//  MovieListContracts.swift
//  MovieBox
//
//  Created by Ebubekir Sezer on 9.06.2021.
//

import Foundation

@objc protocol MovieListViewProtocol: AnyObject {
    var delegate: MovieListViewDelegate? { get set }
    func updateMovieList(_ movieList: [MoviePresentation])
    func setLoading(_ isLoading: Bool)
}

@objc protocol MovieListViewDelegate: AnyObject {
    func didSelectMovie(at index: Int)
}
