//
//  HorizontalMusicViewCell.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 13.01.2021.
//

import UIKit

class HorizontalMusicViewCell: UICollectionViewCell {

    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWith(music: Music){
        songImage.downloadImage(imageUrl: music.artworkUrl100)
        songName.text = music.name
        artistName.text = music.artistName
    }
}
