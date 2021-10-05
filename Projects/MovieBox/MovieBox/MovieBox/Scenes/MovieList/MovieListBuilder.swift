//
//  MovieListBuilder.swift
//  MovieBox
//
//  Created by Ebubekir Sezer on 9.06.2021.
//

import UIKit

final class MovieListBuilder {
    
    static func make() -> MovieListViewController {
        let storyboard = UIStoryboard(name: "MovieList", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MovieListViewController") as! MovieListViewController
        viewController.service = app.service
        return viewController
    }
}
