//
//  TitleViewCell.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 13.01.2021.
//

import UIKit

class TitleViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    private var viewController: HomeViewController?
    private var musicFeed: MediaFeed?
    @IBOutlet weak var seeAllButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.isUserInteractionEnabled = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func seeAllPressed(_ sender: UIButton) {
        print("see all pressed")
    }
    
    func configureWith(musicFeed: MediaFeed, viewController: HomeViewController){
        titleLabel.text = musicFeed.country.uppercased() + " Top Musics"
        self.musicFeed = musicFeed
        self.viewController = viewController
    }
    
}
