//
//  MovieDetailBuilder.swift
//  MovieBoxVIPER
//
//  Created by Ebubekir Sezer on 30.06.2021.
//

import UIKit
import struct MovieBoxAPI.Movie

final class MovieDetailBuilder {
    
    static func make(with movie: Movie) -> MovieDetailViewController {
        let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        let presenter = MovieDetailPresenter(view: viewController, movie: movie)
        viewController.presenter = presenter
        
        return viewController
    }
}
