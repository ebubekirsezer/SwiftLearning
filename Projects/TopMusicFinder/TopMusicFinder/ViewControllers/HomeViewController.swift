//
//  HomeViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 13.01.2021.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var allMusicsTableView: UITableView! {
        didSet{
            allMusicsTableView.delegate = self
            allMusicsTableView.dataSource = self
        }
    }
    
    private var musicsByCountries = [MediaFeed]() {
        didSet{
            self.allMusicsTableView.reloadData()
        }
    }
    
    private var selectedMusicCategoryFeed: MediaFeed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        getAllMusicByTheCountries()
    }
    
    private func getAllMusicByTheCountries(){
        fetchMusics(countryCode: Constants.CountryCodes.turkey)
        fetchMusics(countryCode: Constants.CountryCodes.unitedStates)
        fetchMusics(countryCode: Constants.CountryCodes.france)
    }
    
    private func fetchMusics(countryCode: String, itemCount: Int = 5){
        appWebService?.getTopBy(countryCode: countryCode, mediaType: Constants.MediaType.musics, feedType: Constants.FeedType.topSongs, itemCount: itemCount, completion: { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let mediaFeed):
                self.musicsByCountries.append(mediaFeed)
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        let titleView = MusicTitleView()
        titleView.homeViewControllerDelegate = self
        titleView.mediaFeed = selectedFeed
        titleView.countryTitle.text = selectedFeed.country.uppercased() + " Top Musics"
        return titleView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 3
    }
}
