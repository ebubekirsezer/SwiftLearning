//
//  MediaListViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 15.01.2021.
//

import UIKit

class MediaListViewController: BaseViewController {
    
    @IBOutlet private weak var mediaListTableView: UITableView! {
        didSet{
            mediaListTableView.delegate = self
            mediaListTableView.dataSource = self
        }
    }
    @IBOutlet private weak var mediaActivityIndicator: UIActivityIndicatorView!
    
    private var gallery: [Media] = [] {
        didSet{
            mediaListTableView.reloadData()
        }
    }
    
    var mediaType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMedia()
        registerCells()
    }
    
    private func registerCells(){
        let mediaCell = UINib(nibName: "MediaViewCell", bundle: nil)
        mediaListTableView.register(mediaCell, forCellReuseIdentifier: "MediaViewCell")
    }
    
    private func getMedia(){
        mediaActivityIndicator.startAnimating()
        let feedType = getFeedType(mediaType: mediaType!)
        appWebService?.getTopBy(mediaType: mediaType!, feedType: feedType, itemCount: 10, completion: { (result) in
            switch result{
            case .failure(let error):
                print(error)
                self.mediaActivityIndicator.stopAnimating()
            case .success(let mediaFeed):
                self.gallery = mediaFeed.results
                self.mediaActivityIndicator.stopAnimating()
            }
        })
    }
    
    //Controlling Feed Type
    private func getFeedType(mediaType: String) -> String {
        var type: String
        switch mediaType {
        case Constants.MediaType.appleMusic:
            type = Constants.FeedType.topSongs
        case Constants.MediaType.apps:
            type = Constants.FeedType.topFree
        case Constants.MediaType.audioBooks:
            type = Constants.FeedType.topAudioBooks
        case Constants.MediaType.books:
            type = Constants.FeedType.topFree
        case Constants.MediaType.iTunesMusics:
            type = Constants.FeedType.topSongs
        case Constants.MediaType.iTunesU:
            type = Constants.FeedType.topiTunesUCourses
        case Constants.MediaType.movies:
            type = Constants.FeedType.topMovies
        case Constants.MediaType.musicVideos:
            type = Constants.FeedType.topMusicVideos
        case Constants.MediaType.podcasts:
            type = Constants.FeedType.topPodcasts
        case Constants.MediaType.tvShows:
            type = Constants.FeedType.topTvEpisodes
        default:
            type = ""
        }
        return type
    }
}


extension MediaListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gallery.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaViewCell", for: indexPath) as! MediaViewCell
        let media = gallery[indexPath.row]
        cell.configureWith(media: media)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 2.75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let media = gallery[indexPath.row]
        goToMediaDetailViewController(media: media)
    }
}
