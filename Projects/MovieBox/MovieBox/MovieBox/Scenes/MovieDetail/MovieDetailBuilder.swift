//
//  MovieDetailBuilder.swift
//  MovieBox
//
//  Created by Ebubekir Sezer on 9.06.2021.
//

import UIKit
import MovieBoxAPI

final class MovieDetailBuilder {
    
    static func make(with movie: Movie) -> MovieDetailViewController {
        
        let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MovieDetailViewController") as! MovieDetailViewController
        viewController.movie = movie
        return viewController
    }
}
