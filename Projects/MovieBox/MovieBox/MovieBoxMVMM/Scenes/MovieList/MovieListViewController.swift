//
//  MovieListViewController.swift
//  MovieBoxMVMM
//
//  Created by Ebubekir Sezer on 12.06.2021.
//

import UIKit

final class MovieListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView?
    
    var viewModel: MovieListViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    private var movieList: [MoviePresentation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.load()
    }
}

extension MovieListViewController: MovieListViewModelDelegate {
    
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            print(isLoading)
        case .showMovieList(let movies):
            self.movieList = movies
            tableView?.reloadData()
        }
    }
    
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case .detail(let viewModel):
            let viewController = MovieDetailBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath)
        
        let movie = self.movieList[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.detail
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel?.selectMovie(at: indexPath.row)
    }
}
