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
        fetchMusics()
    }
    
    private func registerCells(){
        let musicCell = UINib(nibName: "MusicViewCell", bundle: nil)
        musicTableView.register(musicCell, forCellReuseIdentifier: "MusicViewCell")
    }
    
    private func fetchMusics(){
        let musicWebService = MusicWebService(countryCode: "tr", itemCount: 10)
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

extension UIViewController {
    func goToAny<T: UIViewController>(viewController: T, from storyboardName: String){
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(identifier: String(describing: T.self)) as? T else { return }
                    
        show(nextViewController, sender: self)
    }
}
