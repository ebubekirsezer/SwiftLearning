//
//  MovieDetailContracts.swift
//  MovieBoxMVMM
//
//  Created by Ebubekir Sezer on 12.06.2021.
//

import Foundation

protocol MovieDetailViewModelDelegate: AnyObject {
    func showDetail(_ presentation: MovieDetailPresentation)
}

protocol MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate? { get set }
    func load()
}
