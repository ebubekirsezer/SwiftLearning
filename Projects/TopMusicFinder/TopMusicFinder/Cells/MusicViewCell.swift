//
//  MusicViewCell.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 12.01.2021.
//

import UIKit

class MusicViewCell: UITableViewCell {

    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet private weak var musicName: UILabel!
    @IBOutlet private weak var artistName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(music: Media){
        musicImage.downloadImage(imageUrl: music.artworkUrl100 ?? Constants.defaultImage)
        musicName.text = music.name
        artistName.text = music.artistName
    }
}
