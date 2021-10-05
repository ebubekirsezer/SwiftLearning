//
//  MovieDetailView.swift
//  MovieBox
//
//  Created by Ebubekir Sezer on 9.06.2021.
//

import UIKit

final class MovieDetailView: UIView {
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var artistNameLabel: UILabel?
    @IBOutlet private weak var genreLabel: UILabel?
}

extension MovieDetailView: MovieDetailViewProtocol {
    
    func updateMovieDetail(_ movieDetail: MovieDetailPresentation) {
        titleLabel?.text = movieDetail.title
        artistNameLabel?.text = movieDetail.artistName
        genreLabel?.text = movieDetail.genre
    }
}
