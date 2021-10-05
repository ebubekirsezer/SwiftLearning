//
//  MovieListRouter.swift
//  MovieBoxVIPER
//
//  Created by Ebubekir Sezer on 27.06.2021.
//

import UIKit

final class MovieListRouter: MovieListRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
     func navigate(to route: MovieListRoute) {
        switch route {
        case .detail(let movie):
            let detailView = MovieDetailBuilder.make(with: movie)
            view.show(detailView, sender: nil)
        }
    }
}
