//
//  HorizontalMusicViewCell.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 13.01.2021.
//

import UIKit

class HorizontalMusicViewCell: UICollectionViewCell {

    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet private weak var songName: UILabel!
    @IBOutlet private weak var artistName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureWith(music: Media){
        songImage.downloadImage(imageUrl: music.artworkUrl100 ?? Constants.defaultImage)
        songName.text = music.name
        artistName.text = music.artistName
    }
}
