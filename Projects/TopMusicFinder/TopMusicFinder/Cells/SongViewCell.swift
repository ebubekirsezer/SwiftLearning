//
//  SongViewCell.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 13.01.2021.
//

import UIKit

class SongViewCell: UITableViewCell {

    @IBOutlet private weak var musicCollectionView: UICollectionView! {
        didSet{
            musicCollectionView.delegate = self
            musicCollectionView.dataSource = self
        }
    }
    
    var viewController: HomeViewController?
    
    var listOfMusics = [Music](){
        didSet{
            DispatchQueue.main.async {
                self.musicCollectionView.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // HorizontalMusicViewCell
        // Configure the view for the selected state
    }
    
    private func registerCell(){
        let horizontalMusicCell = UINib(nibName: "HorizontalMusicViewCell", bundle: nil)
        musicCollectionView.register(horizontalMusicCell, forCellWithReuseIdentifier: "HorizontalMusicViewCell")
    }
    
    func configureWith(musicFeed: MusicFeed, viewController: HomeViewController){
        listOfMusics = musicFeed.results
        self.viewController = viewController
    }
}

extension SongViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfMusics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalMusicViewCell", for: indexPath) as! HorizontalMusicViewCell
        
        let music = listOfMusics[indexPath.row]
        cell.configureWith(music: music)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let musicDetailViewController = storyboard.instantiateViewController(identifier: "MusicDetailViewController") as! MusicDetailViewController
        
        let selectedMusic = listOfMusics[indexPath.row]
        musicDetailViewController.music = selectedMusic
        
        self.viewController?.show(musicDetailViewController, sender: self.viewController)
    }
}

extension SongViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2, height: collectionView.bounds.height)
    }
}
