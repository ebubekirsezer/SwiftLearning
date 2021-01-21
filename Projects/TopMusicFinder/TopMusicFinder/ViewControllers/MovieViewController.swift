//
//  MovieViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 14.01.2021.
//

import UIKit
import Firebase

class MovieViewController: BaseViewController {
    
    @IBOutlet private weak var moviesTableView: UITableView! {
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
    
    @IBAction private func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            goToLoginPage()
        } catch let logoutError as NSError {
            print("Log out error: \(logoutError.localizedDescription)")
        }
    }
    
    private func registerCells(){
        let mediaCell = UINib(nibName: "MediaViewCell", bundle: nil)
        moviesTableView.register(mediaCell, forCellReuseIdentifier: "MediaViewCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaViewCell", for: indexPath) as! MediaViewCell
        
        if let movie = movies?[indexPath.row] {
            cell.configureWith(media: movie)
        }
        //Accessory tint color needs to be white
        cell.accessoryType = .detailDisclosureButton
        cell.tintColor = UIColor.white
        cell.accessoryView?.backgroundColor = UIColor.white
        cell.accessoryView?.tintColor = UIColor.white
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MediaViewCell
        if let selectedMedia = movies?[indexPath.row]{
            saveToCache(image: cell.mediaImage.image!)
            goToMediaDetailViewController(media: selectedMedia)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 3
    }
}
