//
//  MovieListView.swift
//  MovieBox
//
//  Created by Ebubekir Sezer on 9.06.2021.
//

import Foundation
import UIKit

final class MovieListView: UIView {
    weak var delegate: MovieListViewDelegate?
    private var movieList: [MoviePresentation] = []
    @IBOutlet weak var tableView: UITableView!
}

extension MovieListView: MovieListViewProtocol {
    
    func updateMovieList(_ movieList: [MoviePresentation]) {
        self.movieList = movieList
        tableView.reloadData()
    }
    
    func setLoading(_ isLoading: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
}

extension MovieListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as UITableViewCell
        let movie = movieList[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.isHidden = false
        cell.detailTextLabel?.text = movie.detail
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
}

extension MovieListView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectMovie(at: indexPath.row)
    }
}
