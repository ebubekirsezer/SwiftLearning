//
//  MovieDetailContracts.swift
//  MovieBoxVIPER
//
//  Created by Ebubekir Sezer on 30.06.2021.
//

import UIKit

protocol MovieDetailPresenterProtocol {
    func load()
}

protocol MovieDetailViewProtocol: AnyObject {
    func update(_ presentation: MovieDetailPresentation)
}
