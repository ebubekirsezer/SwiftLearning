//
//  HomeViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 13.01.2021.
//

import Foundation
import UIKit
import Firebase

class MusicViewController: BaseViewController {
    
    @IBOutlet private weak var allMusicsTableView: UITableView! {
        didSet{
            allMusicsTableView.delegate = self
            allMusicsTableView.dataSource = self
        }
    }
    @IBOutlet weak var galleryHeaderView: GalleryHeaderView!
    @IBOutlet private weak var musicActivityIndicator: UIActivityIndicatorView!
    
    private var musicsByCountries = [MediaFeed]() {
        didSet{
            self.allMusicsTableView.reloadData()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        getAllMusicByTheCountries()
        updateUI()
    }
    
    @IBAction private func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            goToLoginPage()
        } catch let logoutError as NSError {
            print("Log out error: \(logoutError.localizedDescription)")
        }
    }
    
    private func updateUI(){
        galleryHeaderView.delegate = self
    }
    
    private func getAllMusicByTheCountries(){
        musicActivityIndicator.startAnimating()
        fetchMusics(countryCode: Constants.CountryCodes.turkey)
        fetchMusics(countryCode: Constants.CountryCodes.unitedStates)
        fetchMusics(countryCode: Constants.CountryCodes.france)
        musicActivityIndicator.hidesWhenStopped = true
    }
    
    private func fetchMusics(countryCode: String, itemCount: Int = 5){
        appWebService?.getTopBy(countryCode: countryCode, mediaType: Constants.MediaType.iTunesMusics, feedType: Constants.FeedType.topSongs, itemCount: itemCount, completion: { (result) in
            switch result{
            case .failure(let error):
                print(error)
                self.musicActivityIndicator.stopAnimating()
            case .success(let mediaFeed):
                self.musicsByCountries.append(mediaFeed)
                self.musicActivityIndicator.stopAnimating()

            }
        })
    }
    
    private func registerCells(){
        let songViewCell = UINib(nibName: "SongViewCell", bundle: nil)
        allMusicsTableView.register(songViewCell, forCellReuseIdentifier: "SongViewCell")
        let titleViewCell = UINib(nibName: "TitleViewCell", bundle: nil)
        allMusicsTableView.register(titleViewCell, forCellReuseIdentifier: "TitleViewCell")
    }
}

extension MusicViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return musicsByCountries.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongViewCell", for: indexPath) as! SongViewCell
        cell.homeViewControllerDelegate = self
        let musicFeed = musicsByCountries[indexPath.section]
        cell.configureWith(musicFeed: musicFeed)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {        
        let selectedFeed = musicsByCountries[section]
        let titleView = MusicTitleView(mediaFeed: selectedFeed)
        titleView.homeViewControllerDelegate = self
        return titleView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 4
    }
}
