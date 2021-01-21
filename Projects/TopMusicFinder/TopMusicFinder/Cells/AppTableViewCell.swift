//
//  AppTableViewCell.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 14.01.2021.
//

import UIKit

class AppTableViewCell: UITableViewCell {

    @IBOutlet weak var appImage: RoundedImageView!
    @IBOutlet private weak var appName: UILabel!
    @IBOutlet private weak var appDeveloperName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWith(media: Media){
        appImage.downloadImage(imageUrl: media.artworkUrl100 ?? Constants.defaultImage)
        appName.text = media.name
        appDeveloperName.text = media.artistName
    }
    
    @IBAction func buttonDownloadPressed(_ sender: UIButton) {
        print("download pressed")
    }
}
