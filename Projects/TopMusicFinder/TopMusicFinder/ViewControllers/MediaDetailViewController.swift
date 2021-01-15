//
//  MediaDetailViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 15.01.2021.
//

import UIKit

class MediaDetailViewController: UIViewController {
    
    @IBOutlet private weak var mediaImage: UIImageView!
    @IBOutlet private weak var mediaName: UILabel!
    @IBOutlet private weak var mediaArtisName: UILabel!
    @IBOutlet private weak var mediaCollectionName: UILabel!
    @IBOutlet private weak var mediaReleaseDate: UILabel!
    
    var media: Media?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //Localization
    private func updateUI(){
        if let appMedia = media {
            mediaImage.downloadImage(imageUrl: appMedia.artworkUrl100)
            mediaName.text = appMedia.name
            mediaArtisName.text = appMedia.artistName
            mediaCollectionName.text = appMedia.collectionName
            mediaReleaseDate.text = "Release Date:  \(appMedia.releaseDate)"
        }
    }
}
