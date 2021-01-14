//
//  AllMusicsViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 12.01.2021.
//

import Foundation
import UIKit

class AllMusicsViewController: UIViewController {
    
    @IBOutlet weak var musicTableView: UITableView! {
        didSet {
            musicTableView.delegate = self
            musicTableView.dataSource = self
        }
    }
    
    var countryCode: String?
    
    private var listOfMusic = [Music]() {
        didSet{
            DispatchQueue.main.async {
                self.musicTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        fetchMusics(countryCode: countryCode)
        updateUI()
    }
    
    private func updateUI(){
        title = "Top 15 Musics"
    }
    
    private func registerCells(){
        let musicCell = UINib(nibName: "MusicViewCell", bundle: nil)
        musicTableView.register(musicCell, forCellReuseIdentifier: "MusicViewCell")
    }
    
    private func fetchMusics(countryCode: String?){
        let musicWebService = MusicWebService(countryCode: countryCode!.lowercased(), itemCount: 15)
        musicWebService.fetchTopMusics { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let musicFeed):
                self.listOfMusic = musicFeed.results
            }
        }
    }
}


extension AllMusicsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfMusic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicViewCell", for: indexPath) as! MusicViewCell
        let music = listOfMusic[indexPath.row]
        cell.configureWith(music: music)        
        cell.selectionStyle = .none
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(tableView.bounds.height / 4)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let musicDetailViewController = storyboard.instantiateViewController(identifier: "MusicDetailViewController") as! MusicDetailViewController
        
        let music = listOfMusic[indexPath.row]
        musicDetailViewController.music = music
        
        show(musicDetailViewController, sender: self)
    }
}
