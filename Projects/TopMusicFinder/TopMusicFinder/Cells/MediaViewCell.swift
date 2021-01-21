//
//  MediaViewCell.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 16.01.2021.
//

import UIKit

class MediaViewCell: UITableViewCell {

    @IBOutlet weak var mediaImage: UIImageView!
    @IBOutlet private weak var mediaName: UILabel!
    @IBOutlet private weak var mediaArtistName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureWith(media: Media){
        mediaImage.downloadImage(imageUrl: media.artworkUrl100 ?? Constants.defaultImage)
        mediaName.text = media.name
        mediaArtistName.text = media.artistName
    }
}
