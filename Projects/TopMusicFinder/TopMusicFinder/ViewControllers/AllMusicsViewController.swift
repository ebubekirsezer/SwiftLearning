//
//  AllMusicsViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 12.01.2021.
//

import Foundation
import UIKit

class AllMusicsViewController: BaseViewController {
    
    @IBOutlet private weak var musicTableView: UITableView! {
        didSet {
            musicTableView.delegate = self
            musicTableView.dataSource = self
        }
    }
    @IBOutlet private weak var musicActivityIndicator: UIActivityIndicatorView!
    
    var countryCode: String = ""
    private var musics = [Media]() {
        didSet{
            self.musicTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        fetchMusics(countryCode: countryCode)
        updateUI()
    }
    
    private func updateUI(){
        title = countryCode.uppercased() + " Top 15 Musics"
    }
    
    private func registerCells(){
        let musicCell = UINib(nibName: "MusicViewCell", bundle: nil)
        musicTableView.register(musicCell, forCellReuseIdentifier: "MusicViewCell")
    }
    
    private func fetchMusics(countryCode: String){
        musicActivityIndicator.startAnimating()
        musicActivityIndicator.hidesWhenStopped = true
        appWebService?.getTopBy(countryCode: countryCode, mediaType: Constants.MediaType.iTunesMusics, feedType: Constants.FeedType.topSongs, itemCount: 15, completion: { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let mediaFeed):
                self.musics = mediaFeed.results
                self.musicActivityIndicator.stopAnimating()
            }
        })
    }
}

extension AllMusicsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicViewCell", for: indexPath) as! MusicViewCell
        let music = musics[indexPath.row]
        cell.configureWith(music: music)        
        cell.selectionStyle = .none
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(tableView.bounds.height / 4)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MusicViewCell
        let music = musics[indexPath.row]
        saveToCache(image: cell.musicImage.image!)
        goToMediaDetailViewController(media: music)
    }
}
