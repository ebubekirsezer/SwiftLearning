//
//  MusicTitleView.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 14.01.2021.
//

import UIKit

class MusicTitleView: UIView {
    
    private let countryTitle = UILabel()
    private let seeAllButton = UIButton()
    var mediaFeed: MediaFeed?
    var homeViewControllerDelegate: MusicViewController?
    
    init(mediaFeed: MediaFeed) {
        self.mediaFeed = mediaFeed
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 48))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.clear
        createTitleLabel()
        createSeeAllButton()
    }
    
    private func createTitleLabel(){
        self.addSubview(countryTitle)
        countryTitle.text = (mediaFeed?.country.uppercased() ?? "") + " Top Musics"
        // enables Auto Layout
        countryTitle.translatesAutoresizingMaskIntoConstraints = false
        countryTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        countryTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        countryTitle.textColor = UIColor.white
    }
    
    private func createSeeAllButton(){
        self.addSubview(seeAllButton)
        seeAllButton.translatesAutoresizingMaskIntoConstraints = false
        seeAllButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        seeAllButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        seeAllButton.backgroundColor = UIColor.clear
        seeAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        seeAllButton.setTitle("See All", for: .normal)
        seeAllButton.setTitleColor(UIColor.white, for: .normal)
        
        seeAllButton.addTarget(self, action: #selector(seeAllPressed), for: .touchUpInside)
    }
    
    @objc private func seeAllPressed(_ sender: UIButton){
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let allMusicsVC = storyboard.instantiateViewController(identifier: "AllMusicsViewController") as! AllMusicsViewController
        if let feed = mediaFeed {
            allMusicsVC.countryCode = feed.country
        }
        homeViewControllerDelegate?.show(allMusicsVC, sender: self)
    }
}
