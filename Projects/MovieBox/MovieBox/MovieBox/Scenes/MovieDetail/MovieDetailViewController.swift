//
//  MovieDetailViewController.swift
//  MovieBox
//
//  Created by Ebubekir Sezer on 9.06.2021.
//

import UIKit
import MovieBoxAPI

class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var customView: MovieDetailView?
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView?.updateMovieDetail(MovieDetailPresentation(movie: movie))
    }
}
