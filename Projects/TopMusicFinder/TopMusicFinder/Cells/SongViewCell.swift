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
    
    func configureWith(musicFeed: MusicFeed){
        listOfMusics = musicFeed.results
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
}

extension SongViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2, height: collectionView.bounds.height)
    }
}
