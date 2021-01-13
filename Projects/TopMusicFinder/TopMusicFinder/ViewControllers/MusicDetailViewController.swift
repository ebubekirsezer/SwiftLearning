//
//  MusicDetailViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 12.01.2021.
//

import Foundation
import UIKit

class MusicDetailViewController: UIViewController {
    
    @IBOutlet private weak var songImage: RoundedImageView!
    @IBOutlet private weak var songName: UILabel!
    @IBOutlet private weak var artistName: UILabel!
    @IBOutlet private weak var collectionName: UILabel!
    @IBOutlet private weak var releaseDate: UILabel!
    
    var music: Music? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func updateUI(){
        self.navigationController?.navigationBar.isHidden = true
        
        if let song = music {
            songImage.downloadImage(imageUrl: song.artworkUrl100)
            songName.text = "Song Name: \(song.name ?? "Not Found")"
            artistName.text = "Artist Name: \(song.artistName ?? "Not Found")"
            collectionName.text = "Collection Name: \(song.collectionName ?? "Not Found")"
            releaseDate.text = "Release Date: \(song.releaseDate ?? "Not Found")"
        }
    }
    
    @IBAction private func buttonBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

