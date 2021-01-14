//
//  AppTableViewCell.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 14.01.2021.
//

import UIKit

class AppTableViewCell: UITableViewCell {

    @IBOutlet private weak var appImage: RoundedImageView!
    @IBOutlet private weak var appName: UILabel!
    @IBOutlet private weak var appDeveloperName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureWith(app: App){
        appImage.downloadImage(imageUrl: app.artworkUrl100 ?? "")
        appName.text = app.name
        appDeveloperName.text = app.artistName
    }
    
    @IBAction func buttonDownloadPressed(_ sender: UIButton) {
        print("download pressed")
    }
}
