//
//  GalleryHeaderViewCell.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 16.01.2021.
//

import UIKit

class GalleryHeaderViewCell: UICollectionViewCell {

    @IBOutlet weak var headerImage: RoundedImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWith(media: Media){
        headerImage.downloadImage(imageUrl: media.artworkUrl100 ?? Constants.defaultImage)
    }
}
