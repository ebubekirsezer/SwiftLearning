//
//  MovieDetailBuilder.swift
//  MovieBoxMVMM
//
//  Created by Ebubekir Sezer on 12.06.2021.
//

import UIKit
import MovieBoxAPI

final class MovieDetailBuilder {
    
    static func make(with viewModel: MovieDetailViewModelProtocol) -> MovieDetailViewController {
        let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
