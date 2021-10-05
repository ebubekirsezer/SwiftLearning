//
//  MovieListViewController.swift
//  MovieBoxVIPER
//
//  Created by Ebubekir Sezer on 27.06.2021.
//

import UIKit

final class MovieListViewController: UIViewController, MovieListViewProtocol {

    @IBOutlet private weak var tableView: UITableView?
    
    var presenter: MovieListPresenterProtocol!
    
    private var movies: [MoviePresentation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
    
    func handleOutput(_ output: MovieListPresenterOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            print("loading \(isLoading)")
        case .showMovieList(let moviePresentations):
            self.movies = moviePresentations
            tableView?.reloadData()
        }
    }
}


extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath)
        
        let movie = self.movies[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.detail
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
}

extension MovieListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter.selectMovie(at: indexPath.row)
    }
}
