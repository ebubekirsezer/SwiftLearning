//
//  HomeViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 13.01.2021.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var allMusicsTableView: UITableView! {
        didSet{
            allMusicsTableView.delegate = self
            allMusicsTableView.dataSource = self
        }
    }
    
    var listOfMusicByCountries = [MusicFeed]() {
        didSet{
            DispatchQueue.main.async {
                self.allMusicsTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        getAllMusicByTheCountries()
    }
    
    private func getAllMusicByTheCountries(){
        fetchMusics(countryCode: "tr")
        fetchMusics(countryCode: "gb")
        fetchMusics(countryCode: "de")
        fetchMusics(countryCode: "fr")
    }
    
    private func fetchMusics(countryCode: String, itemCount: Int = 5){
        let musicWebService = MusicWebService(countryCode: countryCode, itemCount: itemCount)
        musicWebService.fetchTopMusics { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let musicFeed):
                self.listOfMusicByCountries.append(musicFeed)
            }
        }
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
        return listOfMusicByCountries.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongViewCell", for: indexPath) as! SongViewCell
        
        let musicFeed = listOfMusicByCountries[indexPath.section]
        cell.configureWith(musicFeed: musicFeed, viewController: self)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleViewCell") as! TitleViewCell
        
        let musicFeed = listOfMusicByCountries[section]
        cell.configureWith(musicFeed: musicFeed)
        
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 3
    }
    
    
}
