//
//  MovieListViewController.swift
//  MovieBox
//
//  Created by Ebubekir Sezer on 9.06.2021.
//

import UIKit
import MovieBoxAPI

final class MovieListViewController: UIViewController {
    
    @IBOutlet weak var customView: MovieListViewProtocol? {
        didSet {
            customView?.delegate = self
        }
    }
    var service: TopmoviesServiceProtocol?
    private var movieList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
        customView?.setLoading(true)
        service?.fetchTopMovies(completion: { [weak self] result in
            
            switch result {
            case .success(let value):
                self?.movieList = value.results
                let moviePresentations = value.results.map(MoviePresentation.init)
                self?.customView?.updateMovieList(moviePresentations)
            case .failure(let error):
                print(error)
            }
            
            self?.customView?.setLoading(false)
        })
    }
}

extension MovieListViewController: MovieListViewDelegate {
    
    func didSelectMovie(at index: Int) {
        let movie = movieList[index]
        let movieDetailViewController = MovieDetailBuilder.make(with: movie)
        show(movieDetailViewController, sender: nil)
    }
}
