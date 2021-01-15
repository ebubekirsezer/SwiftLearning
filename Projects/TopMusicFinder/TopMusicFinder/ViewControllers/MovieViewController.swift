//
//  MovieViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 14.01.2021.
//

import UIKit

class MovieViewController: BaseViewController {
    
    @IBOutlet weak var moviesTableView: UITableView! {
        didSet{
            moviesTableView.delegate = self
            moviesTableView.dataSource = self
        }
    }
    @IBOutlet private weak var movieActivityIndicator: UIActivityIndicatorView!
    
    private var movies: [Media]? {
        didSet{
            moviesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        getMovies()
    }
    
    private func registerCells(){
        let movieCell = UINib(nibName: "MovieViewCell", bundle: nil)
        moviesTableView.register(movieCell, forCellReuseIdentifier: "MovieViewCell")
    }
    
    private func getMovies(){
        movieActivityIndicator.startAnimating()
        movieActivityIndicator.hidesWhenStopped = true
        appWebService?.getTopBy(mediaType: Constants.MediaType.movies, feedType: Constants.FeedType.topMovies, itemCount: 10, completion: { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let mediaFeed):
                self.movies = mediaFeed.results
                self.movieActivityIndicator.stopAnimating()
            }
        })
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieViewCell", for: indexPath) as! MovieViewCell
        
        if let movie = movies?[indexPath.row] {
            cell.configureWith(movie: movie)
        }
        //Accessory tint color needs to be white
        cell.tintColor = UIColor.white
        cell.accessoryView?.backgroundColor = UIColor.white
        cell.accessoryView?.tintColor = UIColor.white
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedMedia = movies?[indexPath.row]{
            goToMediaDetailViewController(media: selectedMedia)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 3
    }
}
